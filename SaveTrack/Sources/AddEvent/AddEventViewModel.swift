//
//  AddEventViewModel.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

final class AddEventViewModel: ViewModel {
    private let repository: Repository = Repository()
    @Published var state: State
    
    init(state: State) {
        self.state = state
    }
    
    struct State {
        var dismiss: Bool = false
        var name: String = ""
        var purpose: String = ""
        var morningCheerMessage: String = ""
        var afternoonCheerMessage: String = ""
        var eveningCheerMessage: String = ""
        var selectedDay: [Week] = []
        var selectedCategory: Category? = nil
    }
    
    enum Input {
        case selectCategory(CategoryCase)
        case selectDay(Week)
    }
    
    func trigger(_ input: Input) {
        switch input {
        case .selectCategory(let category):
            state.selectedCategory = category.toCategory
            
        case .selectDay(let day):
            selectDay(day: day)
        }
        
    }
}

private extension AddEventViewModel {
    func selectDay(day: Week) {
        if state.selectedDay.contains(day) {
            state.selectedDay = state.selectedDay.filter({ $0 != day })
        } else {
            state.selectedDay.append(day)
        }
    }
    
    func addEvent() async {
        do {
            let model = EventModel(name: state.name,
                              purpose: state.purpose,
                              dayOfWeeks: state.selectedDay.map({ $0.rawValue }),
                              categoryId: state.selectedCategory?.id ?? "",
                              morningCheerMessage: state.morningCheerMessage,
                              afternoonCheerMessage: state.afternoonCheerMessage,
                              eveningCheerMessage: state.eveningCheerMessage)
            
            try await repository.addEvent(model)
            
            state.dismiss = true
        } catch {
            print(error)
        }
        
        
    }
}
