//
//  ToolCalling.swift
//  SwiftLLM
//
//  Created by ke Liu on 4/15/26.
//
import WeatherKit
import CoreLocation
import FoundationModels
import Playgrounds

struct GetWeatherTool: Tool {
    let name = "getWeather"
    let description: String = "Retrieve the latest weather information for a city"
    
    @Generable
    struct Arguments {
        @Guide(description: "The city to fetch the weather for")
        var city: String
    }
    
    func call(arguments: Arguments) async throws -> some PromptRepresentable {
        let places = try await CLGeocoder().geocodeAddressString(arguments.city)
        let weather = try await WeatherService.shared.weather(for: places.first!.location!)
        let temperature = weather.currentWeather.temperature.value
        
        let content = GeneratedContent(properties: ["temperature": temperature])
//        let output = ToolOutput(content)
        
        // Or if your tool’s output is natural language:
        // let output = ToolOutput("\(arguments.city)'s temperature is \(temperature) degrees.")
        
        return content
    }
}

#Playground {
    let session = LanguageModelSession(
        tools: [GetWeatherTool()],
        instructions: "Help the user with weather forecasts"
    )
    
    let response = try await session.respond(to: "What is the temperature in Cupertino?")
    
    print(response.content)
}
