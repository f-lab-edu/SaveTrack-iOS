//
//  SelectionView.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/12/24.
//

import SwiftUI

struct SelectionView: View {
    var isSelected: Bool
    var selectedColor: Color
    
    private let width: CGFloat = 25.0
    private let lineWidth: CGFloat = 2.0
    
    var body: some View {
        if !isSelected {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: lineWidth)
                .foregroundStyle(Color.secondary)
                .frame(width: width, height: width)
        } else {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: lineWidth)
                .foregroundStyle(selectedColor)
                .frame(width: width, height: width)
                .overlay(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 5.0*0.75)
                        .frame(width: width*0.75, height: width*0.75)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundStyle(selectedColor)
                }
        }
    }
}

#Preview {
    SelectionView(isSelected: true, selectedColor: .green)
}
