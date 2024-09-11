//
//  LoginView.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/11/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            SaveTrackAsset.Assets.kakaoLoginImage.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 60)
        })
    }
}

#Preview {
    LoginView()
}
