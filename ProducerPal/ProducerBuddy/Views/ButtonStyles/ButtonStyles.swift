//
//  ButtonStyles.swift
//  Producer Pal
//
//  Created by Marshall  on 2/15/22.
//

import SwiftUI

//THE LOOK OF EACH BUTTONSTYLE
struct SimpleButtonStyle: ButtonStyle {
    
    var buttonColor: Color
    
    @Environment(\.colorScheme) var colorScheme
    
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
                        .overlay(Circle().stroke(LinearGradient(buttonColor, colorScheme == .dark ? Color.darkEnd : Color.offWhite), lineWidth: 4))
                      //  .overlay(Circle().stroke(buttonColor, lineWidth: 4))
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: colorScheme == .dark ? Color.black.opacity(0.7) : Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
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
