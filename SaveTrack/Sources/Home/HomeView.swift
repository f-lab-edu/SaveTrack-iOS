//
//  HomeView.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/12/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var isShowAddEventView: Bool = false
    @State private var selectedEvent: EventModel?
    @State private var isShowBounce: Bool = false
    @State private var imageName: String = ""
    var body: some View {
        
        ScrollView {
            addEventView
            LazyVStack(spacing: 20.0) {
                todayEventsView
                popularEventsView
                myBadgesView
            }
        }
        .frame(maxWidth: .infinity)
        .gradientBackground()
        .modifier(BounceAnimationModifier(isShow: $isShowBounce,
                                          imageName: imageName,
                                          complete: {
            
        }))
        .onAppear(perform: {
            viewModel.trigger(.onAppear)
        })
        .sheet(item: $selectedEvent, content: { item in
            EventDetailView(viewModel: .init(state: .init(event: item)))
        })
        .sheet(isPresented: $isShowAddEventView, content: {
            AddEventView(viewModel: .init(state: .init()), complete: { eventmodel in
                viewModel.state.todayEvent.append(eventmodel)
                viewModel.state.report.append(eventmodel)
            })
        })
        
        
    }
}

extension HomeView {
    private var addEventView: some View {
        VStack {
            HStack(spacing: 0.0) {
                Image([CategoryCase.allCases].randomElement()?.first?.imageName ?? "")
                    .resizable()
                    .scaledToFit()
                Text("추가하기")
                    .font(.SaveTrack.title)
                    .foregroundStyle(.purple)
            }
            .frame(height: 30.0)
            .padding(.trailing, 16.0)
            .background(.white)
            .cornerRadius(15.0)
            .padding(.trailing, 16.0)
            .onTapGesture {
                isShowAddEventView = true
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    private var todayEventsView: some View {
        VStack(spacing: 0.0) {
            Text("오늘의 절약")
                .font(.SaveTrack.title)
                .foregroundStyle(.purple)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16.0)
            
            ForEach(viewModel.state.todayEvent) { event in
                SavingCheckView(title: event.name,
                                image: event.category.imageName,
                                isCompleted: .constant(event.checked),
                                didTapped: { isCompleted in
                    if let index = viewModel.state.todayEvent.firstIndex(where: { $0.eventId == event.eventId }) {
                        viewModel.state.todayEvent[index].checked.toggle()
                        if  viewModel.state.todayEvent[index].checked {
                            AnimationManger.Shared.emitImages(name: event.category.imageName)

                        }
                    }
                })
                .padding(.horizontal, 16.0)
            }
        }
        .background(.white)
        .cornerRadius(16.0)
        .padding(.horizontal, 16.0)
    }
    
    private var popularEventsView: some View {
        VStack(spacing: 0.0) {
            Text("진행중이 절약")
                .font(.SaveTrack.title)
                .foregroundStyle(.purple)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16.0)
                .onTapGesture {
                    imageName = "money1"
                    isShowBounce = true
                }
               
            ForEach(viewModel.state.report) { event in
                HStack(spacing: 8.0) {
                    Text(event.name).font(.SaveTrack.content)
                    Spacer()
                    Image(event.category.imageName)
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                }
                .frame(height: 56.0)
                .padding(.horizontal, 16.0)
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedEvent = event
                }
            }
            
        }
        .background(.white)
        .cornerRadius(16.0)
        .padding(.horizontal, 16.0)
    }
    
    private var myBadgesView: some View {
        VStack(spacing: 0.0) {
            Text("나의 뱃지")
                .font(.SaveTrack.title)
                .foregroundStyle(.purple)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16.0)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10.0) {
                    ForEach(viewModel.state.badges) { badge in
                        
                        Image(badge.imageName)
                            .resizable()
                            .frame(width: 60.0, height: 60.0)
                    }
                }
                .padding()
            }
        }
        .background(.white)
        .cornerRadius(16.0)
        .padding(.horizontal, 16.0)
    }
}

#Preview {
    HomeView(viewModel: .init(state: .init()))
}
