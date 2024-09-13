//
//  GetCategoryListDTO.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/13/24.
//

import Foundation

struct GetCategoryListDTO: Decodable {
    let categoryId: Int
    let categoryName: String
}
