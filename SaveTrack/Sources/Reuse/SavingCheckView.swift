//
//  SavingCheckView.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/12/24.
//

import SwiftUI

struct SavingCheckView: View {
    let title: String = "절약이벤트이름"
    @State var isCompleted: Bool = false
    
    var body: some View {
        HStack {
            Text(title).font(.SaveTrack.content)
            Spacer()
            Button(action: {
                isCompleted.toggle()
            }, label: {
                SelectionView(isSelected: isCompleted, selectedColor: .green)
            })
        }
    }
}

#Preview {
    SavingCheckView()
}
