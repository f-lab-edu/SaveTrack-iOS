//
//  Badge.swift
//  SaveTrack
//
//  Created by SUN on 9/14/24.
//

import Foundation

struct Badge: Identifiable {
    var id: Int {
        badgeId
    }
    var badgeId: Int
    var badgeName: String
    var acquired: Bool
    
    var imageName: String {
        badgeName
    }
}
