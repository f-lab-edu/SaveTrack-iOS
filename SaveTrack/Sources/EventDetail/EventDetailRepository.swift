//
//  EventDetailRepository.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/14/24.
//

final class EventDetailRepository {
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func loadEventDetail(eventId: String) async -> EventModel? {
        let request = Targets.getEventDetail(eventId: eventId)
        let result = try? await apiService.request(request: request, response: BaseResponseDTO<GetEventDetailDTO>.self)
        guard case .data(let eventDTO) = result?.data else { return nil }
        // TODO: categoryId랑 message 0, 1, 2 맞는지 확인..
        return EventModel(
            eventId: 213213,
            name: eventDTO.name,
            purpose: eventDTO.purpose,
            dayOfWeeks: eventDTO.dayOfWeeks,
            categoryId: eventDTO.categoryName,
            morningCheerMessage: eventDTO.cheerMessages[0].cheerMessage,
            afternoonCheerMessage: eventDTO.cheerMessages[1].cheerMessage,
            eveningCheerMessage: eventDTO.cheerMessages[2].cheerMessage
        )
    }
}
