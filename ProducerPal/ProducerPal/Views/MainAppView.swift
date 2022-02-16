//
//  ContentView.swift
//  ProducerPal
//
//  Created by Marshall  on 2/15/22.
//

import SwiftUI
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
                
                ZStack(alignment: .bottom) {
                    if colorScheme == .dark {
                            Color.darkEnd
                            .edgesIgnoringSafeArea(.all)
                    } else {
                            Color.offWhite
                            .edgesIgnoringSafeArea(.all)
                        }
                    
                Link("Your Ad Here", destination: URL(string: "https://www.youtube.com/watch?v=et0I1y0EuoU")!)
                    
                }
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: colorScheme == .dark ? Color.black.opacity(0.7) : Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                .frame(minHeight: 20, maxHeight: 30)
               
            }
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
.previewInterfaceOrientation(.portrait)
            
            MainAppView()
                .previewDevice("iPhone 12 Pro")
                .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
            MainAppView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 8")
.previewInterfaceOrientation(.portrait)
            MainAppView()
                .previewDevice("iPhone 13 Pro Max")
.previewInterfaceOrientation(.landscapeRight)
            MainAppView()
                .previewDevice("iPad Air (4th generation)")
.previewInterfaceOrientation(.landscapeLeft)
            MainAppView()
                .previewDevice("iPad Air (4th generation)")
        }
    }
}

