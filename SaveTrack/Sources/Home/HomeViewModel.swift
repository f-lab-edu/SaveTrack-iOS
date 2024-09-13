//
//  HomeViewModel.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

final class HomeViewModel: ViewModel {
    private let repository: Repository = Repository()
    @Published var state: State
    
    init(state: State) {
        self.state = state
    }
    
    struct State {
        var todayEvent: [TodayEvent] = [.init(eventId: 44, eventName: "Gg", checked: false, category: .money),
                                        .init(eventId: 74, eventName: "Gg", checked: false, category: .electric),
                                        .init(eventId: 45, eventName: "Gg", checked: false, category: .time)]
        var badges: [Badge] = [.init(badgeId: 1, badgeName: "money1", acquired: true)]
        var report: [TodayEvent] = [.init(eventId: 44, eventName: "Gg", checked: false, category: .money),
                                    .init(eventId: 74, eventName: "Gg", checked: false, category: .electric),
                                    .init(eventId: 45, eventName: "Gg", checked: false, category: .time)]
    }
    
    enum Input {
        case onAppear
    }
    
    func trigger(_ input: Input) {
        switch input {
        case .onAppear:
            onAppear()
        }
    }
}

extension HomeViewModel {
    func onAppear() {
        Task {
            await withTaskGroup(of: Void.self) { group in
                // getTodayEvent() 실행
                group.addTask {
                    await self.getTodayEvent()
                }
                
                // getBadges() 실행
                group.addTask {
                    await self.getBadges()
                }
                
                // 그룹의 모든 작업이 완료될 때까지 대기
                await group.waitForAll()
            }
        }
    }
    
    func getTodayEvent() async {
        do {
            let todayEvent = try await repository.getTodayEvent()
            DispatchQueue.main.async { [weak self] in
                self?.state.todayEvent = todayEvent
                self?.state.report = todayEvent
            }
            
        } catch {
            print(error)
        }
    }
    
    func getReport() async {
        do {
            let todayEvent = try await repository.getTodayEvent()
            DispatchQueue.main.async { [weak self] in
                self?.state.report = todayEvent
            }
            
        } catch {
            print(error)
        }
    }
    
    func getBadges() async {
        do {
            let badges = try await repository.getBadgeList()
            DispatchQueue.main.async { [weak self] in
                self?.state.badges = badges
            }
        } catch {
            print(error)
        }
    }
}
