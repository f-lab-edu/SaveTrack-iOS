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
               
        emitterLayer.birthRate = 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
            self?.emitterLayer.birthRate = 0
        }
        UIApplication.shared.keyWindow?.layer.addSublayer(emitterLayer)
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
