//
//  APIService.swift
//  SaveTrack
//
//  Created by SUN on 4/30/24.
//

import Alamofire

protocol APIServiceProtocol {
    func request<Target: URLRequestConvertible, Response: Codable>(request: Target, response: Response.Type) async throws -> Response
}

final class APIService: APIServiceProtocol {
    /// api request 함수
    func request<Target: URLRequestConvertible, Response: Codable>(request: Target, response: Response.Type) async throws -> Response {
        let result = await API.requestToExternalAPI(request)
            .validate()
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

