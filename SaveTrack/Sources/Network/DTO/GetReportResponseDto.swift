//
//  GetReportResponseDto.swift
//  SaveTrack
//
//  Created by SUN on 9/14/24.
//

import Foundation

struct GetReportResponseDto: Codable {
    var eventId: Int?
    var categoryId : String?
    var eventName : String?
    var checked: Bool?
}
