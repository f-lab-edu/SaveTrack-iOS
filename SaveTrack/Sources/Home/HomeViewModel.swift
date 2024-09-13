//
//  HomeViewModel.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

final class HomeViewModel: ViewModel {
    @Published var state: State
    
    init(state: State) {
        self.state = state
    }
    
    struct State {
        var todayEvent: [TodayEvent] = [.init(eventId: 44, eventName: "Gg", checked: false)]
    }
    
    enum Input {
        
    }
    
    func trigger(_ input: Input) {
        
    }
}

extension HomeViewModel {
    
}
