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
                    
            
          Link("PRODUCER PAL", destination: URL(string: "https://moosecatrecording.com")!)
                .foregroundColor(Color(colorScheme == .dark ? .white : .black))
                .font(.title)
                .opacity(0.5)
                .padding(.top)
            
            
        }
        .shadow(color: colorScheme == .dark ? Color.black.opacity(0.2) : Color.white.opacity(0.2), radius: 10, x: 10, y: 10)
        .shadow(color: Color.black.opacity(0.7), radius: 10, x: -5, y: -5)
        .frame(minHeight: 20, maxHeight: 30)
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
        HeaderView()
            .preferredColorScheme(.dark)

            
    }
}

