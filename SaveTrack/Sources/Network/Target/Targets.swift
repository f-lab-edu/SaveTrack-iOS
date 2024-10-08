//
//  Targets.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Alamofire

enum Targets {
    case addEvent(AddEventRequestDTO)
    case getEventDetail(eventId: String)
    case modifyEvent(eventId: String, body: ModifyEventBodyDTO)
    case subscribeEvent(eventId: String)
    case unsubscribeEvent(eventId: String)
    case completeEvent(eventId: String)
    case getEventList(query: GetEventListQueryDTO)
    case getBadgeList
    case getCategoryList
    case getReport(GetReportDTO)
}

extension Targets: Target {
    var baseURL: String {
        Secrets.ProjectURLs.PROJECT_API_URL
    }
    
    var path: String {
        switch self {
        case .addEvent:
            return "/events"
        case .getEventDetail(let eventId):
            return "/events/\(eventId)"
        case .modifyEvent(let eventId, _):
            return "/events/\(eventId)"
        case .subscribeEvent(let eventId):
            return "/events/\(eventId)/subscribe"
        case .unsubscribeEvent(let eventId):
            return "/events/\(eventId)/subscribe"
        case .completeEvent(let eventId):
            return "/events/\(eventId)/check"
        case .getEventList:
            return "/events"
        case .getBadgeList:
            return "/badges"
        case .getCategoryList:
            return "/categories"
        case .getReport:
            return "/reports"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .addEvent:
            return .post
        case .getEventDetail:
            return .get
        case .modifyEvent:
            return .put
        case .subscribeEvent:
            return .post
        case .unsubscribeEvent:
            return .delete
        case .completeEvent:
            return .post
        case .getEventList:
            return .get
        case .getBadgeList:
            return .get
        case .getCategoryList:
            return .get
            
        case .getReport:
            return .get
        }
    }
    
    var headers: [String : String] {
        ["Content-Type": "application/json"]
    }
    
    var parameter: RequestParameter {
        switch self {
        case .addEvent(let parameter):
            return .queryNBody(nil, parameter)
        case .getEventDetail:
            return .none
        case .modifyEvent(_, let body):
            return .queryNBody(nil, body)
        case .subscribeEvent:
            return .none
        case .unsubscribeEvent:
            return .none
        case .completeEvent:
            return .none
        case .getEventList(let query):
            return .queryNBody(query, nil)
        case .getBadgeList:
            return .none
        case .getCategoryList:
            return .none
            
        case .getReport(let parameter):
            return .queryNBody(nil, parameter)
        }
    }
}
