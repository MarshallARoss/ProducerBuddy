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
        
        guard let randomSoundOption = sound.sounds.randomElement() else {return}
        
        let resource = randomSoundOption
        
        guard let url = Bundle.main.url(forResource: resource, withExtension: ".mp3") else {return}
        
        
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

//Name each file one of these and vice versa
enum SoundOption: String {
    case tada
    case badum
    case ThatWasGreatLetsTryThatAgain
    
    var sounds: [String] {
        switch self {
        case .tada:
            return ["tada", "tada2"]
        case .badum:
            return ["badum"]
        case .ThatWasGreatLetsTryThatAgain:
            return ["ThatWasGreatLetsTryThatAgain01",
                    "ThatWasGreatLetsTryThatAgain02",
                    "ThatWasGreatLetsTryThatAgain03",
                    "ThatWasGreatLetsTryThatAgain04",
                    "ThatWasGreatLetsTryThatAgain05",
                    "ThatWasGreatLetsTryThatAgain06"]
        }
    }
}


