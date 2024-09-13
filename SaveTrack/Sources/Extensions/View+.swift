//
//  View+.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import SwiftUI

extension View {
    func gradientBackground() -> some View {
        self
            .background(Color.clear.modifier(GradientBackground()))
    }
}

struct GradientBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background( AngularGradient(gradient: Gradient(colors: [SaveTrackAsset.Assets.blue0860D6.swiftUIColor,
                                                                     Color.purple]),
                                         center: .topLeading,
                                         angle: .degrees(180 + 45))
                .edgesIgnoringSafeArea(.all))
    }
}
