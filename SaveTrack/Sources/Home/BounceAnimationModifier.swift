//
//  BounceAnimationModifier.swift
//  SaveTrack
//
//  Created by SUN on 9/14/24.
//

import SwiftUI

struct BounceAnimationModifier: ViewModifier {
    @State private var isAnimate: Bool = false
    @Binding var isShow: Bool

    var imageName: String
    
    var complete : () -> Void
    
    init(isShow: Binding<Bool>,
         imageName: String,
         complete: @escaping () -> Void) {
        self._isShow = isShow
        self.imageName = imageName
        self.complete = complete
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isShow {
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                Image(imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaleEffect(isAnimate ? 1.2 : 1.0)
                    .offset(y: isAnimate ? -80 : 0)
                    .animation(
                        Animation.easeInOut(duration: 0.3)
                            .repeatCount(6, autoreverses: true),
                        value: isAnimate
                    )
            }
        }
        .onChange(of: isShow, perform: { value in
            if value {
                isAnimate = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isAnimate = false
                    isShow = false
                    complete()
                }
            }
        })
            
    }
}
