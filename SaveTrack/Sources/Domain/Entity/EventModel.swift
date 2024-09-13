//
//  Event.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

struct EventModel: Identifiable {
//    var id: UUID = UUID()
    var id: String {
        name
    }
    var name: String
    var purpose: String
    var dayOfWeeks: [String]
    var categoryId: String
    var morningCheerMessage: String
    var afternoonCheerMessage: String
    var eveningCheerMessage: String
    
    init( name: String, purpose: String, dayOfWeeks: [String], categoryId: String, morningCheerMessage: String, afternoonCheerMessage: String, eveningCheerMessage: String) {
//        self.id = id
        self.name = name
        self.purpose = purpose
        self.dayOfWeeks = dayOfWeeks
        self.categoryId = categoryId
        self.morningCheerMessage = morningCheerMessage
        self.afternoonCheerMessage = afternoonCheerMessage
        self.eveningCheerMessage = eveningCheerMessage
    }
}
