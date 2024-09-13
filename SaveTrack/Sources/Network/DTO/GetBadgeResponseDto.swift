//
//  GetBadgeResponseDto.swift
//  SaveTrack
//
//  Created by SUN on 9/14/24.
//

import Foundation

struct GetBadgeResponseDto: Codable {
    var badgeId: Int?
    var badgeName: String?
    var acquired: Bool?
}
