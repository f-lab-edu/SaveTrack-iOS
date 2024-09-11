//
//  SecretsLoad.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/11/24.
//

import Foundation

enum Secrets {
    static let KAKAO_APP_KEY = Bundle.main.object(forInfoDictionaryKey: "KAKAO_APP_KEY") as? String
}
