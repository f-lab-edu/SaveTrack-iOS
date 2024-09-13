//
//  GetBadgeListDTO.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/13/24.
//

import Foundation

struct GetBadgeListDTO: Decodable {
    let badgeId: Int?
    let badgeName: String?
    let acquired: Bool?
}
