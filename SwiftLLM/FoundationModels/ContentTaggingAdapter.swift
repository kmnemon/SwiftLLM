//
//  ContentTaggingAdapter.swift
//  SwiftLLM
//
//  Created by ke Liu on 4/15/26.
//

import FoundationModels
import Playgrounds

// Content tagging use case

@Generable
struct Top3ActionEmotionResult {
    @Guide(.maximumCount(3))
    let actions: [String]
    
    @Guide(.maximumCount(3))
    let emotions: [String]
}

#Playground {
    let session = LanguageModelSession(
        model: SystemLanguageModel(useCase: .contentTagging),
        instructions: "Tag the 3 most important actions and emotions in the given input text."
    )
    
    let response = try await session.respond(to: "Alice walked to the store, argued with the clerk, then felt relieved after apologizing.", generating: Top3ActionEmotionResult.self)
    print(response.content)
}

