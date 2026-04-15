//
//  StatefulSessions.swift
//  SwiftLLM
//
//  Created by ke Liu on 4/15/26.
//

import FoundationModels
import Playgrounds
import SwiftUI

#Playground {
    // Multi-turn interactions
    
    let session = LanguageModelSession()
    
    let firstHaiku = try await session.respond(to: "Write a haiku about fishing")
    print(firstHaiku.content)
    // Silent waters gleam,
    // Casting lines in morning mist—
    // Hope in every cast.
    
    let secondHaiku = try await session.respond(to: "Do another one about golf")
    print(secondHaiku.content)
    // Silent morning dew,
    // Caddies guide with gentle words—
    // Paths of patience tread.
    
    print(session.transcript)
    // (Prompt) Write a haiku about fishing
    // (Response) Silent waters gleam...
    // (Prompt) Do another one about golf
    // (Response) Silent morning dew...
}


struct HaikuView: View {
    @State private var session = LanguageModelSession()
    @State private var haiku: String?
    
    var body: some View {
        if let haiku {
            Text(haiku)
        }
        Button("Go!") {
            Task {
                haiku = try await session.respond(
                    to: "Write a haiku about something you haven't yet"
                ).content
            }
        }
        .disabled(session.isResponding)
    }
}
