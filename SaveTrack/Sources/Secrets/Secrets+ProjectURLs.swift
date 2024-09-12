//
//  Secrets+ProjectURLs.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/11/24.
//

import Foundation

extension Secrets {
    enum ProjectURLs {
        static let PROJECT_API_URL = Bundle.main.object(forInfoDictionaryKey: "PROJECT_API_URL") as! String
    }
}
