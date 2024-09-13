//
//  EventDetailView.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/13/24.
//

import SwiftUI

struct EventDetailView: View {
    @StateObject var viewModel: EventDetailViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.state.eventTitles.indices, id: \.self) { index in
                    eventItem(title: viewModel.state.eventTitles[index], content: viewModel.state.eventContents[index])
                        .clipShape(RoundedRectangle(cornerRadius: 7.0))
                        .padding(EdgeInsets(top: 2.5, leading: 10.0, bottom: 2.5, trailing: 10.0))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gradientBackground()
       
    }
    
    @ViewBuilder
    func eventItem(title: String, content: String) -> some View {
        HStack {
            Text(title)
                .font(Font.SaveTrack.title)
                .foregroundStyle(.purple)
            Spacer()
            Text(content)
                .font(Font.SaveTrack.content2)
                .foregroundStyle(.purple)
        }
        .padding(EdgeInsets(top: 12.5, leading: 10.0, bottom: 12.5, trailing: 10.0))
        .background(.white)
    }
}

#Preview {
    EventDetailView(viewModel: .init(state: .init()))
}
