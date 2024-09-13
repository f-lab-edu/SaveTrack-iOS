//
//  HomeView.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/12/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView(content: {
            ScrollView {
                LazyVStack(spacing: 20.0) {
                    todayEventsView
                    popularEventsView
                    myBadgesView
                }
            }
            .frame(maxWidth: .infinity)
            .gradientBackground()
        })
    }
}

extension HomeView {
    private var todayEventsView: some View {
        VStack(spacing: 0.0) {
            Text("오늘의 절약")
                .font(.SaveTrack.title)
                .foregroundStyle(.purple)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16.0)
            
            ForEach(viewModel.state.todayEvent) { event in
                SavingCheckView(title: event.eventName,
                                image: "",
                                isCompleted: .constant(event.checked),
                                didTapped: { isCompleted in
                    
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
            Text("인기있는 절약")
                .font(.SaveTrack.title)
                .foregroundStyle(.purple)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16.0)
            
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
        }
        .background(.white)
        .cornerRadius(16.0)
        .padding(.horizontal, 16.0)
    }
}

#Preview {
    HomeView(viewModel: .init(state: .init()))
}
