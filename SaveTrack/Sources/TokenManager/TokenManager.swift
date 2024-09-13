//
//  TokenManager.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/13/24.
//

import Foundation

final class TokenManager {
    static let tokenKey = "SaveTrackToken"
    
    static func saveToken(_ token: String?) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    static func readToken() -> String? {
        UserDefaults.standard.object(forKey: tokenKey) as? String
    }
    
    static func removeToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
