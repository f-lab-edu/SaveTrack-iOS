//
//  GetEventDetailDTO.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/13/24.
//

import Foundation

struct GetEventDetailDTO: Decodable {
    let eventId, name, purpose: String
    let dayOfWeeks: [String]
    let joinCount: Int
    let categoryName: String
    let cheerMessages: [CheerMessageDTO]
}

struct CheerMessageDTO: Decodable {
    let timeOfDay, cheerMessage: String
}
