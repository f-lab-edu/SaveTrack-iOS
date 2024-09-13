//
//  TodayEvent.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

struct TodayEvent: Identifiable {
    var id: Int {
        eventId
    }
    var eventId: Int
    var eventName: String
    var checked: Bool
}
