//
//  Targets.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Alamofire

enum Targets {
    case addEvent(AddEventRequestDTO)
}

extension Targets: Target {
    var baseURL: String {
        Secrets.ProjectURLs.PROJECT_API_URL
    }
    
    var path: String {
        switch self {
        case .addEvent:
            return "api/events"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .addEvent:
            return .post
        }
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var parameter: RequestParameter {
        switch self {
        case .addEvent(let parameter):
            return .queryNBody(nil, parameter)
        }
    }
    
    
}
