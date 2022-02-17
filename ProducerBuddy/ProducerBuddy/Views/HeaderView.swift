//
//  HeaderView.swift
//  Producer Pal
//
//  Created by Marshall  on 2/15/22.
//

import SwiftUI

//THE PRODUCER PAL HEADER
struct HeaderView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        ZStack{
            
            if colorScheme == .dark {
                    Color.darkEnd
                    .edgesIgnoringSafeArea(.all)
            } else {
                    Color.offWhite
                    .edgesIgnoringSafeArea(.all)
                }
                    
            
            VStack {

                Link(destination: URL(string: "https://moosecatrecording.com")!) {
                    VStack {
                        Image("MooseCatLogo")
                        
                        Text("PRODUCER BUDDY")
                            .foregroundColor(Color(colorScheme == .dark ? .white : .black))
                            .font(.title)
                            .opacity(0.5)
                    }
                }
            }       
        }
        .frame(maxHeight: 120)
        .background(
            Color.offWhite
        .shadow(color: Color.black.opacity(0.7), radius: 10, x: -5, y: -5)
        .shadow(color: colorScheme == .dark ? Color.black.opacity(0.2) : Color.white.opacity(0.2), radius: 10, x: 10, y: 10)
        )
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
        HeaderView()
            .preferredColorScheme(.dark)

            
    }
}

