//
//  BannerAdSwiftUI.swift
//  Producer Pal
//
//  Created by Marshall  on 2/15/22.
//

/*
 
 
import SwiftUI
import GoogleMobileAds

//https://developers.google.com/admob/ios/banner?hl=en-US

struct BannerAdSwiftUI: View {
    @State var height: CGFloat = 0 //Height of ad
    @State var width: CGFloat = 0 //Width of ad
    @State var adPosition: AdPosition
    
    @State var adOpacity = CGFloat(0.0)
   
    let adUnitId: String
    
    init(adPosition: AdPosition, adUnitId: String) {
        self.adPosition = adPosition
        self.adUnitId = adUnitId
    }
    
    enum AdPosition {
        case top
        case bottom
    }
    
    public var body: some View {
        VStack {
            if adPosition == .bottom {
                Spacer() //Pushes ad to bottom
            }
                        
            //Ad
            BannerAd(adUnitId: adUnitId)
                .offset(y: 50 - adOpacity*50)
                .opacity(adOpacity)
                .frame(width: width, height: height, alignment: .center)
                .onAppear {
                    //Call this in .onAppear() b/c need to load the initial frame size
                    //.onReceive() will not be called on initial load
                    setFrame()

                }
                //Changes the frame of the ad whenever the device is rotated.
                //This is what creates the adaptive ad
                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                        setFrame()
                    
                }
                

            
            if adPosition == .top {
                Spacer() //Pushes ad to top
            }
        }
    }
    
    func setFrame() {
        
        adOpacity = 0.0
      
        //Get the frame of the safe area
        let safeAreaInsets = UIEdgeInsets()
       
        
        let frame = UIScreen.main.bounds.inset(by: safeAreaInsets)
                
        //Use the frame to determine the size of the ad
        let adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(frame.width)
        
        //Set the ads frame
        withAnimation(.easeOut(duration: 2).delay(4)) {
            adOpacity = 1.0
        }
        
        self.height = adSize.size.height
        self.width = adSize.size.width
    }
}

final class BannerAd: UIViewControllerRepresentable {
        
    let adUnitId: String
    
    init(adUnitId: String) {
        self.adUnitId = adUnitId
    }
    
    
    func makeUIViewController(context: Context) -> BannerAdVC {
        return BannerAdVC(adUnitId: adUnitId)
    }

    func updateUIViewController(_ uiViewController: BannerAdVC, context: Context) {
        
    }
}



struct BannerAdSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        BannerAdSwiftUI(adPosition: .bottom, adUnitId: "ca-app-pub-3940256099942544/2934735716")
    }
}

 */

