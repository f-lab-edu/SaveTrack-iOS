//
//  BaseResponseDTO.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/12/24.
//

import Foundation

struct BaseResponseDTO<T: Decodable>: Decodable {
    let code: Int
    let message: String
    let data: DataContent<T>
    
    enum DataContent<U: Decodable>: Decodable {
        case data(U)
        case stackTrace([String])
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            if let data = try? container.decode(U.self, forKey: .data) {
                self = .data(data)
            } else if let stackTrace = try? container.decode([String].self, forKey: .stackTrace) {
                self = .stackTrace(stackTrace)
            } else {
                throw DecodingError.dataCorruptedError(forKey: .data, in: container, debugDescription: "DataContent does not match any known type")
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case data
            case stackTrace
        }
    }
}
