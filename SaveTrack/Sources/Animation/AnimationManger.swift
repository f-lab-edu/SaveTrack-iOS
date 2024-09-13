//
//  AnimationManger.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import UIKit

final class AnimationManger {
    static let Shared = AnimationManger()
    
    private init() {}
    
    private let emitterLayer = CAEmitterLayer()
    private func emojiEmiterCell(name: String) -> [CAEmitterCell] {
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: name)?.cgImage
        cell.lifetime = 3
        cell.birthRate = 100
        cell.scale = 0.15
        cell.scaleRange = 0.05
        cell.spin = 5
        cell.spinRange = 10
        cell.emissionRange = CGFloat.pi * 2
        cell.velocity = 700
        cell.velocityRange = 50
        cell.yAcceleration = 1200
        
        return [cell]
    }
    
    func emitImages(name: String) {
        emitterLayer.emitterCells = emojiEmiterCell(name: name)
        emitterLayer.emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: 100)
               
        //cell 의 birth rate와 곱해져서 총 birth rate 가 정해짐
        emitterLayer.birthRate = 1
        
        //birthRate를 0을 설정해주지 않으면 시간동안 계속 cell을 방출함.
        // 한번 방출하고 끝내는것 처럼 보이게 엄청 짧게 설정
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
            //birth rate 가 0이 되면 더 이상 값을 방출하지 않는 것처럼 보임
            self?.emitterLayer.birthRate = 0
        }
        // 레이어 얹어주면 방출 시작되는 것 보임.
        // 신기한건 클릭할때마다 addSublayer가 불리니까 layer가 계속 쌓일거 같은데 count 로 찍어보면 계속 1임
        UIApplication.firstKeyWindowForConnectedScenes?.window?.layer.addSublayer(emitterLayer)
    }
}

extension UIApplication {
    // MARK: - get key window
    static var firstKeyWindowForConnectedScenes: UIWindow? {
        UIApplication.shared
        // Of all connected scenes...
            .connectedScenes.lazy
        
        // ... grab all foreground active window scenes ...
            .compactMap { $0.activationState == .foregroundActive ? ($0 as? UIWindowScene) : nil }
        
        // ... finding the first one which has a key window ...
            .first(where: { $0.keyWindow != nil })?
        
        // ... and return that window.
            .keyWindow
    }
}
