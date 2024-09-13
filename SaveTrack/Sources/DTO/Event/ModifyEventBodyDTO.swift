//
//  ModifyEventBodyDTO.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/13/24.
//

import Foundation

struct ModifyEventBodyDTO: Encodable {
    let name, purpose: String
    let dayOfWeeks: [String]
    let categoryId, morningCheerMessage, afternoonCheerMessage, eveningCheerMessage: String
}
