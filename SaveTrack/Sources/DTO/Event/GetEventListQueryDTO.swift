//
//  GetEventListQueryDTO.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/13/24.
//

import Foundation

struct GetEventListQueryDTO: Encodable {
    let page: Int
    let size: Int
    let categoryId: String
}
