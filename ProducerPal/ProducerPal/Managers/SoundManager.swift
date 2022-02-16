//
//  SoundsManager.swift
//  ProducerPal
//
//  Created by Marshall  on 2/15/22.
//

import Foundation
import AVKit

class SoundManager: ObservableObject {
    
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        
        do {
            
            player = try AVAudioPlayer(contentsOf: url)
            DispatchQueue.global().async {
                self.player?.play()
            }
            
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
}


enum SoundOption: String {
    case tada = "tada_sound"
    case badum
}
