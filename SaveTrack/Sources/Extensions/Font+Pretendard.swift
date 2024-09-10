//
//  Font+Pretendard.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/10/24.
//

import SwiftUI

extension Font {
    enum PretendardWeight {
        case black
        case bold
        case extraBold
        case extraLight
        case light
        case medium
        case regular
        case semiBold
        case thin
    }
    
    static func pretendard(_ weight: PretendardWeight, size: CGFloat) -> Font {
        let fontConvertible = switch weight {
        case .black     : SaveTrackFontConvertible(name: "Pretendard-Black", family: "Pretendard", path: "Pretendard-Black.otf")
        case .bold      : SaveTrackFontConvertible(name: "Pretendard-Bold", family: "Pretendard", path: "Pretendard-Bold.otf")
        case .extraBold : SaveTrackFontConvertible(name: "Pretendard-ExtraBold", family: "Pretendard", path: "Pretendard-ExtraBold.otf")
        case .extraLight: SaveTrackFontConvertible(name: "Pretendard-ExtraLight", family: "Pretendard", path: "Pretendard-ExtraLight.otf")
        case .light     : SaveTrackFontConvertible(name: "Pretendard-Light", family: "Pretendard", path: "Pretendard-Light.otf")
        case .medium    : SaveTrackFontConvertible(name: "Pretendard-Medium", family: "Pretendard", path: "Pretendard-Medium.otf")
        case .regular   : SaveTrackFontConvertible(name: "Pretendard-Regular", family: "Pretendard", path: "Pretendard-Regular.otf")
        case .semiBold  : SaveTrackFontConvertible(name: "Pretendard-SemiBold", family: "Pretendard", path: "Pretendard-SemiBold.otf")
        case .thin      : SaveTrackFontConvertible(name: "Pretendard-Thin", family: "Pretendard", path: "Pretendard-Thin.otf")
        }
        return fontConvertible.swiftUIFont(size: size)
    }
}
