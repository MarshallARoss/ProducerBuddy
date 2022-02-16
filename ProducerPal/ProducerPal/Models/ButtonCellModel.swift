//
//  ButtonCellModel.swift
//  ProducerPal
//
//  Created by Marshall  on 2/15/22.
//

import Foundation
import SwiftUI

struct ButtonCell: Hashable {
    
    var id = UUID().uuidString
    let title: String
    let soundOption: SoundOption
    let color: Color
    
    static func buttonArray() -> [ButtonCell] {
        
        let buttonArray = [
            
            ButtonCell(title: "Good Take", soundOption: .tada, color: Color.blue),
           
            ButtonCell(title: "Let's Try That Again", soundOption: .tada, color: Color.green),
       
            ButtonCell(title: "This Time With More Energy", soundOption: .tada, color: Color.pink),
            
            ButtonCell(title: "Can you tune up?", soundOption: .tada, color: Color.purple),
            
            ButtonCell(title: "Cell Phone Off Yo!", soundOption: .tada, color: Color.orange),
            
            ButtonCell(title: "how long can one of these phrases be before it gets cutoff?", soundOption: .tada, color: Color.cyan)
        ]
        
        return buttonArray
    }
    
}


