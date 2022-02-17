//
//  ContentView.swift
//  ProducerPal
//
//  Created by Marshall  on 2/15/22.
//

import SwiftUI
import UIKit
import AVFoundation

struct MainAppView: View {
    
    @Environment(\.colorScheme) var colorScheme
        
    @ObservedObject var motion = MotionManager()
        
    let buttons = ButtonCell.buttonArray()
    
    let layout: [GridItem] = [
        GridItem(.adaptive(minimum: 130, maximum: 800)),
    ]
    
    var body: some View {
        
        ZStack {
                        
            if colorScheme == .dark {
                    Color.darkEnd
                    .edgesIgnoringSafeArea(.all)
            } else {
                    Color.offWhite
                    .edgesIgnoringSafeArea(.all)
                }
                        
            VStack {
                
                HeaderView()
                
                ScrollView{
                    
                    LazyVGrid(columns: layout, spacing: 15) {
                        
                        ForEach(buttons, id: \.self) { item in
                            
                            ButtonCellView(button: item)
                                .rotation3DEffect(.degrees(-motion.x * 20), axis: (x: 0, y: 1, z: 0))
                            
                        }
                        .padding(.top, 6)
                    }
                    .padding()

                    
                }
                .padding(.top, -5)
                
            }
            

          //  BannerAdSwiftUI(adPosition: .bottom, adUnitId: Secrets.testID)
             
            
        }
        
    }
}


//BUTTON ACTION AND CONFIGURATION
struct ButtonCellView: View {
    
    var button: ButtonCell
    
    var body: some View {
        
         ZStack{
             
             Button {
                 
                 SoundManager.shared.playSound(sound: button.soundOption)
                 HapticsManager.shared.impact()

             } label: {
               
                 Text(button.title)
                     .fontWeight(.semibold)
                     .multilineTextAlignment(.center)
                 
             }
             .buttonStyle(SimpleButtonStyle(buttonColor: button.color))
         }
    }
}


struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainAppView()
                .previewDevice("iPhone 12 Pro")
                .preferredColorScheme(.light)
            
            MainAppView()
                .previewDevice("iPhone 12 Pro")
                .preferredColorScheme(.dark)
            
            /*
.previewInterfaceOrientation(.portrait)
            MainAppView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 8")
.previewInterfaceOrientation(.portrait)
            MainAppView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 8")
                .previewInterfaceOrientation(.portraitUpsideDown)
            MainAppView()
                .previewDevice("iPhone 13 Pro Max")
.previewInterfaceOrientation(.portraitUpsideDown)
            MainAppView()
                .previewDevice("iPad Air (4th generation)")
.previewInterfaceOrientation(.landscapeLeft)
            MainAppView()
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    */
             }
    }
}

