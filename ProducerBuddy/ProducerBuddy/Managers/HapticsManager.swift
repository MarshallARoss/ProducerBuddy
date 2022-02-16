//
//  HapticsManager.swift
//  ProducerPal
//
//  Created by Marshall  on 2/15/22.
//

import SwiftUI

class HapticsManager {
    
    static let shared = HapticsManager()
    
    func notification() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func impact() {
        let generator = UIImpactFeedbackGenerator(style: .rigid)
        
        DispatchQueue.main.async {
           generator.impactOccurred()
        }
        }

    
}
