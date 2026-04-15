//
//  ModelAvilable.swift
//  SwiftLLM
//
//  Created by ke Liu on 4/15/26.
//

import FoundationModels
import SwiftUI

struct Trop: View {
    let landmark: String
    private let mode = SystemLanguageModel.default
    
    var body: some View {
        switch mode.availability {
        case .available:
        case.unavailable(let a):
        }
    }
}
