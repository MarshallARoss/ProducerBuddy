//
//  SoundsManager.swift
//  ProducerPal
//
//  Created by Marshall  on 2/15/22.
//

import Foundation
import AVKit

class SoundManager: ObservableObject {
    
    //https://www.advancedswift.com/play-a-sound-in-swift/
    
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            
            DispatchQueue.global().async {
                self.player?.play()
            }
            
        } catch {
            //Error
            print(error.localizedDescription)
        }
    }
}


enum SoundOption: String {
    case tada = "tada_sound"
    case badum
}
