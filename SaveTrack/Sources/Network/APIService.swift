//
//  APIService.swift
//  SaveTrack
//
//  Created by SUN on 4/30/24.
//  Edited by Jinyoung Kim on 9/12/24.
//

import Foundation

import Alamofire

protocol APIServiceProtocol {
    func request<Target: URLRequestConvertible, Response: Decodable>(request: Target, response: Response.Type) async throws -> Response
}

final class APIService: APIServiceProtocol {
    /// api request 함수
    func request<Target: URLRequestConvertible, Response: Decodable>(request: Target, response: Response.Type) async throws -> Response {
        let result = await API.requestToExternalAPI(request)
            .serializingDecodable(response.self)
            .result
        switch result {
        case .success(let success):
            return success
        case .failure(let failure):
            throw failure
        }
    }
}

fileprivate final class API {
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let session = Session(configuration: configuration, eventMonitors: [NetworkEventLogger()])
        return session
    }()
    static let timeOut: TimeInterval = 5.0
    
    static func requestToExternalAPI(_ convertible: URLRequestConvertible, interceptor: RequestInterceptor? = nil) -> DataRequest {
        return session.request(convertible, interceptor: interceptor)
    }
}
