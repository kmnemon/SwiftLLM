//
//  Untitled.swift
//  SwiftLLM
//
//  Created by ke Liu on 4/15/26.
//

import FoundationModels
import Playgrounds

#Playground {
    let session = LanguageModelSession()
    let response = try await session.respond(to: "What's a good name for a trip to Japan? Respond only with a title")
}

#Playground {
    let session = LanguageModelSession(
        instructions: """
            You are a helpful assistant who always responds in rhyme.
            """
    )
    
    let response = try await session.respond(to: "What's a good name for a trip to Japan? Respond only with a title")
}
