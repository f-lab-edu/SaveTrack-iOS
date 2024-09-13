//
//  AddEventRequestDTO.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

struct AddEventRequestDTO: Codable {
    var name: String
    var purpose: String
    var dayOfWeeks: [String]
    var categoryId: String
    var morningCheerMessage: String
    var afternoonCheerMessage: String
    var eveningCheerMessage: String
}
