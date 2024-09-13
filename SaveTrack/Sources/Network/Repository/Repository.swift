//
//  Repository.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

final class Repository {
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
}

extension Repository {
    func addEvent(_ model: Event) async throws {
        let requestDto = AddEventRequestDTO(name: model.name,
                                          purpose: model.purpose,
                                          dayOfWeeks: model.dayOfWeeks,
                                          categoryId: model.categoryId,
                                          morningCheerMessage: model.morningCheerMessage,
                                          afternoonCheerMessage: model.afternoonCheerMessage,
                                          eveningCheerMessage: model.eveningCheerMessage)
        let _ = try await apiService.request(request: Targets.addEvent(requestDto), response: BaseResponseDTO<EmptyDto>.self)
    }
}
