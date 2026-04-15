//
//  SnapshotStream.swift
//  SwiftLLM
//
//  Created by ke Liu on 4/15/26.
//

// PartiallyGenerated types

import FoundationModels
import Playgrounds
import SwiftUI


//#Playground {
//    let session = LanguageModelSession()
//    
//    let stream = session.streamResponse(
//        to: "Craft a 3-day itinerary to Mt. Fuji.",
//        generating: Itinerary.self
//    )
//    
//    for try await partial in stream {
//        print(partial)
//        print("~~~")
//    }
//}


@Generable struct Itinerary {
    var name: String
    var days: [Int]
}

struct ItineraryView: View {
    let session: LanguageModelSession
    let dayCount: Int
    let landmarkName: String
  
    @State private var itinerary: Itinerary.PartiallyGenerated?
  
    var body: some View {
        //...
        Button("Start") {
            Task {
                do {
                    let prompt = """
                        Generate a \(dayCount) itinerary \
                        to \(landmarkName).
                        """
                  
                    let stream = session.streamResponse(
                        to: prompt,
                        generating: Itinerary.self
                    )
                  
                    for try await partial in stream {
//                        self.itinerary = partial
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}
