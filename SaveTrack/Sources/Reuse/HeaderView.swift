//
//  HeaderView.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/12/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.SaveTrack.title)
            .foregroundStyle(.white)
            .padding(10.0)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            
    }
}

#Preview {
    HeaderView(title: "주간 진행상황")
}
