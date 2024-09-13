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
    func addEvent(_ model: EventModel) async throws {
        let requestDto = AddEventRequestDTO(name: model.name,
                                          purpose: model.purpose,
                                          dayOfWeeks: model.dayOfWeeks,
                                          categoryId: model.categoryId,
                                          morningCheerMessage: model.morningCheerMessage,
                                          afternoonCheerMessage: model.afternoonCheerMessage,
                                          eveningCheerMessage: model.eveningCheerMessage)
        let _ = try await apiService.request(request: Targets.addEvent(requestDto), response: BaseResponseDTO<EmptyDto>.self)
    }
    
    func getTodayEvent() async throws -> [TodayEvent] {
        let requestDto = GetReportDTO(startDate: Date().toString(format: "yyyy-MM-dd"),
                                      endDate: Date().toString(format: "yyyy-MM-dd"))
        let result = try await apiService.request(request: Targets.getReport(requestDto),
                                        response: BaseResponseDTO<[GetReportResponseDto]>.self)
        guard case .data(let reportDTO) = result.data else { return [] }
        
        return reportDTO.map({ TodayEvent(eventId: $0.eventId ?? 0,
                                          eventName: $0.eventName ?? "",
                                          checked: $0.checked ?? false,
                                          category: .init(rawValue: $0.categoryId ?? "") ?? .money)})
        
    }
    
    func getBadgeList() async throws -> [Badge] {
        let result = try await apiService.request(request: Targets.getBadgeList,
                                        response: BaseResponseDTO<[GetBadgeListDTO]>.self)
        guard case .data(let badgeListDTO) = result.data else { return [] }
        
        return badgeListDTO.filter({ $0.acquired == true })
            .map({ Badge(badgeId: $0.badgeId ?? 0,
                         badgeName: $0.badgeName ?? "",
                         acquired: $0.acquired ?? true )})
        
    }
}
