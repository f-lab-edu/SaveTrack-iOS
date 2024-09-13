//
//  Event.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

struct EventModel: Identifiable {
//    var id: UUID = UUID()
    var id: Int {
        eventId
    }
    var eventId: Int
    var name: String
    var purpose: String
    var dayOfWeeks: [String]
    var categoryId: String
    var morningCheerMessage: String
    var afternoonCheerMessage: String
    var eveningCheerMessage: String
    var checked: Bool = false
    var category: CategoryCase {
        .init(rawValue: categoryId) ?? .money
    }
    
    init(eventId: Int, name: String, purpose: String, dayOfWeeks: [String], categoryId: String, morningCheerMessage: String, afternoonCheerMessage: String, eveningCheerMessage: String) {
        self.eventId = eventId
        self.name = name
        self.purpose = purpose
        self.dayOfWeeks = dayOfWeeks
        self.categoryId = categoryId
        self.morningCheerMessage = morningCheerMessage
        self.afternoonCheerMessage = afternoonCheerMessage
        self.eveningCheerMessage = eveningCheerMessage
    }
}
