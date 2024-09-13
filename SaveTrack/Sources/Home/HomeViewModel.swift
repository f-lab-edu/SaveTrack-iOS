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
        var todayEvent: [EventModel] = [.init(eventId: 33, name: "에어컨 낮에 안틀기",
                                              purpose: "돈 아끼자",
                                              dayOfWeeks: ["토", "일"],
                                              categoryId: "category-001", morningCheerMessage: "화이팅하자", afternoonCheerMessage: "화이팅하자", eveningCheerMessage: "화이팅하지"),
                                        .init(eventId: 35, name: "점심 비용 아끼기",
                                                             purpose: "돈 아끼자",
                                                             dayOfWeeks: ["토", "일"],
                                                             categoryId: "category-002", morningCheerMessage: "화이팅하지", afternoonCheerMessage: "화이팅하지", eveningCheerMessage: "화이팅하지"),
                                        .init(eventId: 333, name: "지하철탈때 영어공부 하기",
                                                             purpose: "시간을 아끼자",
                                                             dayOfWeeks: ["토", "일"],
                                                             categoryId: "category-003", morningCheerMessage: "화이팅하지", afternoonCheerMessage: "화이팅하지", eveningCheerMessage: "화이팅하지")]
        var badges: [Badge] = [.init(badgeId: 1, badgeName: "money1", acquired: true)]
        var report: [EventModel] =  [.init(eventId: 33, name: "에어컨 낮에 안틀기",
                                           purpose: "돈 아끼자",
                                           dayOfWeeks: ["토", "일"],
                                           categoryId: "category-001", morningCheerMessage: "화이팅하자", afternoonCheerMessage: "화이팅하자", eveningCheerMessage: "화이팅하지"),
                                     .init(eventId: 35, name: "점심 비용 아끼기",
                                                          purpose: "돈 아끼자",
                                                          dayOfWeeks: ["토", "일"],
                                                          categoryId: "category-002", morningCheerMessage: "화이팅하지", afternoonCheerMessage: "화이팅하지", eveningCheerMessage: "화이팅하지"),
                                     .init(eventId: 333, name: "지하철탈때 영어공부 하기",
                                                          purpose: "시간을 아끼자",
                                                          dayOfWeeks: ["토", "일"],
                                                          categoryId: "category-003", morningCheerMessage: "화이팅하지", afternoonCheerMessage: "화이팅하지", eveningCheerMessage: "화이팅하지")]
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
//            await withTaskGroup(of: Void.self) { group in
//                // getTodayEvent() 실행
//                group.addTask {
//                    await self.getTodayEvent()
//                }
//                
//                // getBadges() 실행
//                group.addTask {
//                    await self.getBadges()
//                }
//                
//                // 그룹의 모든 작업이 완료될 때까지 대기
//                await group.waitForAll()
//            }
        }
    }
    
    func getTodayEvent() async {
        do {
            let todayEvent = try await repository.getTodayEvent()
//            DispatchQueue.main.async { [weak self] in
//                self?.state.todayEvent = todayEvent
//                self?.state.report = todayEvent
//            }
            
        } catch {
            print(error)
        }
    }
    
    func getReport() async {
        do {
            let todayEvent = try await repository.getTodayEvent()
//            DispatchQueue.main.async { [weak self] in
//                self?.state.report = todayEvent
//            }
            
        } catch {
            print(error)
        }
    }
    
    func getBadges() async {
        do {
            let badges = try await repository.getBadgeList()
//            DispatchQueue.main.async { [weak self] in
//                self?.state.badges = badges
//            }
        } catch {
            print(error)
        }
    }
}
