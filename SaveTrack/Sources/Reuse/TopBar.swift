//
//  TopBar.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import SwiftUI

struct TopBar: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.white)
                .font(.SaveTrack.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 56.0)
        }
        .padding(.horizontal, 16.0)
    }
}
