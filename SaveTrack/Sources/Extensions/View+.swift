//
//  View+.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import SwiftUI

extension View {
    
}


import SwiftUI

struct GradientBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
//            .background( AngularGradient(gradient: Gradient(colors: [SaveTrackAsset.Assets.blue0860D6.swiftUIColor,
//                                                                          Color.purple]),
//                                         center: .topLeading,
//                                         angle: .degrees(180 + 45))
//                .edgesIgnoringSafeArea(.all))
            .background(LinearGradient(gradient: Gradient(colors: [SaveTrackAsset.Assets.blue0860D6.swiftUIColor, .purple]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                .ignoresSafeArea())
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        Color.clear
            .modifier(GradientBackground())
       
    }
}
