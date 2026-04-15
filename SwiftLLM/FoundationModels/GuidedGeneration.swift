//
//  Generate.swift
//  SwiftLLM
//
//  Created by ke Liu on 4/15/26.
//

import FoundationModels
import Playgrounds

@Generable
struct SearchSuggestions {
    @Guide(description: "A list of suggested search terms", .count(4))
    var searchTerms: [String]
}

#Playground {
    let prompt = """
        Generate a list of suggested search terms for an app about visting famous landmarks.
        """
    
    let session = LanguageModelSession()
    let response = try await session.respond(to: prompt, generating: SearchSuggestions.self)
    
    print(response.content)
}
