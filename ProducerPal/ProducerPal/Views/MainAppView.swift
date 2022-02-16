//
//  ContentView.swift
//  ProducerPal
//
//  Created by Marshall  on 2/15/22.
//

import SwiftUI
import AVFoundation

struct MainAppView: View {
        
    @ObservedObject var motion = MotionManager()
    
    let buttons = ButtonCell.buttonArray()
    
    let layout: [GridItem] = [
        GridItem(.adaptive(minimum: 130, maximum: 800)),
    ]
    
    var body: some View {
        
        ZStack {
            
           // LinearGradient(Color.darkStart, Color.darkEnd)
            Color.offWhite.ignoresSafeArea()
            
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
                    Color.white
                        .ignoresSafeArea()
                    
                Link("Your Ad Here", destination: URL(string: "https://www.youtube.com/watch?v=et0I1y0EuoU")!)
                    
                }
                .frame(maxHeight: 30)
               

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

//THE LOOK OF EACH BUTTONSTYLE
struct SimpleButtonStyle: ButtonStyle {
    
    var buttonColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        ZStack{
            
            Group{
                
                if configuration.isPressed {
                    Circle()
                        .fill(buttonColor)
                        .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(buttonColor, Color.clear)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, buttonColor)))
                            )
                } else {
                    Circle()
                        .fill(buttonColor)
                        .overlay(Circle().stroke(LinearGradient(buttonColor, Color.offWhite), lineWidth: 4))
                      //  .overlay(Circle().stroke(buttonColor, lineWidth: 4))
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                }
            }
            
            configuration.label
                .foregroundColor(Color.white)
                .lineLimit(3)
                .padding(.horizontal, 30)
            
        }
        .frame(height: 150)
    }
    
}


//THE PRODUCER PAL HEADER
struct HeaderView: View {
    var body: some View {
        ZStack{
            
            Color.offWhite
                .edgesIgnoringSafeArea(.all)
            
            Text("PRODUCER PAL")
                .foregroundColor(Color(.black))
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
                .opacity(0.5)
            
        }
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        .frame(minHeight: 20, maxHeight: 30)
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

