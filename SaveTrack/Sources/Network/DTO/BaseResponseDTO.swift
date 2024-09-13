//
//  BaseResponseDTO.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/12/24.
//

import Foundation

struct BaseResponseDTO<T: Decodable>: Decodable {
    let code: Int
    let message: String?
    let data: DataContent<T>?
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.code = try container.decode(Int.self, forKey: CodingKeys.code)
        self.message = try container.decodeIfPresent(String.self, forKey: CodingKeys.message)
        
        if let data = try container.decodeIfPresent(T.self, forKey: CodingKeys.data) {
            self.data = .data(data)
        } else if let stackTrace = try container.decodeIfPresent([String].self, forKey: CodingKeys.data) {
            self.data = .stackTrace(stackTrace)
        } else {
            throw DecodingError.dataCorruptedError(forKey: .data, in: container, debugDescription: "DataContent does not match any known type")
        }
    }
    
    enum CodingKeys: CodingKey {
        case code
        case message
        case data
    }
    
    enum DataContent<U: Decodable>: Decodable {
        case data(U)
        case stackTrace([String])
    }
}

struct EmptyDto: Decodable {
    // 빈 dto
}
