//
//  BuildinUseCase.swift
//  SwiftLLM
//
//  Created by ke Liu on 4/15/26.
//

import FoundationModels
import Playgrounds

#Playground {
    // Using a built-in use case

    let session = LanguageModelSession(
        model: SystemLanguageModel(useCase: .contentTagging)
    )
}
