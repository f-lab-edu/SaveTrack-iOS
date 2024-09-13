//
//  EventDetailViewModel.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/13/24.
//

import Foundation

final class EventDetailViewModel: ViewModel {
    private let repository: EventDetailRepository = EventDetailRepository()
    @Published var state: State
    
    init(state: State) {
        self.state = state
    }
    
    struct State {
        let eventTitles = ["이벤트 이름", "목적", "반복 날짜", "카테고리", "아침 메시지", "점심 메시지", "저녁 메시지"]
        var event: EventModel?
        var eventContents: [String] {
            guard let event else {
                return eventTitles.map { _ in return "" }
            }
            return [
                event.name,
                event.purpose,
                event.dayOfWeeks.joined(separator: " · "),
                event.categoryId,
                event.morningCheerMessage,
                event.afternoonCheerMessage,
                event.eveningCheerMessage
            ]
        }
    }
    
    enum Input {
        case load(eventId: String)
    }
    
    func trigger(_ input: Input) {
        switch input {
        case .load(let eventId):
            Task {
                let event = await repository.loadEventDetail(eventId: eventId)
                await MainActor.run {
                    state.event = event
                }
            }
        }
    }
}
