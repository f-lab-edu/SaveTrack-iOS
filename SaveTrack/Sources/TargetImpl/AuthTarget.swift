//
//  AuthTarget.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/12/24.
//

import Foundation

import Alamofire

enum AuthTarget {
    case kakaoLogin(accessToken: String)
}

extension AuthTarget: Target {
    var baseURL: String {
        Secrets.ProjectURLs.PROJECT_API_URL + "/auth"
    }

    var path: String {
        switch self {
        case .kakaoLogin(let accessToken):
            return "/oauth"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .kakaoLogin(let accessToken):
            return .post
        }
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var parameter: RequestParameter {
        switch self {
        case .kakaoLogin(let accessToken):
            // TODO: kakao가 아닌듯. 수정하기
            let body: [String: String] = [
                "provider": "kakao",
                "accessToken": accessToken
            ]
            return .queryNBody(nil, body)
        }
    }
}
