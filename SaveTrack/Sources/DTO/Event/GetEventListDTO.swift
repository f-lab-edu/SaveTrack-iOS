//
//  GetEventListDTO.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/13/24.
//

import Foundation

struct GetEventListDTO: Decodable {
    let eventId, name, purpose: String
    let dayOfWeeks: [String]
    let joinCount: Int
}
