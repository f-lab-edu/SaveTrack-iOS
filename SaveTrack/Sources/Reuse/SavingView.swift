//
//  SavingView.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/12/24.
//

import SwiftUI

struct SavingView: View {
    let title: String = "에어컨 낮에만 틀기"
    let category: String = "전기 절약"
    let repeatDays: String = "일 · 월 · 화 · 수 · 목 · 금 · 토"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.SaveTrack.content2)
                Text(category)
                    .font(.SaveTrack.content3)
                    .foregroundStyle(.secondary)
                Text(repeatDays)
                    .font(.SaveTrack.content3)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text("92명")
                .font(.SaveTrack.content)
        }
    }
}

#Preview {
    SavingView()
}
