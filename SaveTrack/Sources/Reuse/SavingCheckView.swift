//
//  SavingCheckView.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/12/24.
//

import SwiftUI

struct SavingCheckView: View {
    let title: String
    var image: String
    @Binding var isCompleted: Bool
    var didTapped: (Bool) -> Void
    
    init(title: String,
         image: String,
         isCompleted: Binding<Bool>,
         didTapped: @escaping (Bool) -> Void) {
        self.title = title
        self.image = image
        self._isCompleted = isCompleted
        self.didTapped = didTapped
    }
    var body: some View {
        HStack(spacing: 8.0) {
            Image(image)
                .resizable()
                .frame(width: 30.0, height: 30.0)
            
            Text(title).font(.SaveTrack.content)
            Spacer()
            Button(action: {
                isCompleted.toggle()
                didTapped(isCompleted)
            }, label: {
                SelectionView(isSelected: isCompleted, selectedColor: .green)
            })
        }
        .frame(height: 56.0)
    }
}

#Preview {
    SavingCheckView(title: "절약 이벤트", 
                    image: SaveTrackAsset.Assets.electric1.name,
                    isCompleted: .constant(false), didTapped: { _ in })
}
