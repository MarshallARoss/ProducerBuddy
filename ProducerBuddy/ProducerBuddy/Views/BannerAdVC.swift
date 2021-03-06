//
//  BannerAdVC.swift
//  Producer Pal
//
//  Created by Marshall  on 2/15/22.
//

/*

import UIKit
import GoogleMobileAds

//https://medium.com/geekculture/adding-google-mobile-ads-admob-to-your-swiftui-app-in-ios-14-5-5073a2b99cf9

//ANOTHER OPTION TO ADD ADS IF THEY AREN'T WORKING
//https://medium.com/swiftui-made-easy/admob-banners-in-swiftui-4ebbf27ac572

class BannerAdVC: UIViewController {
    let adUnitId: String
    
    //Initialize variable
    init(adUnitId: String) {
        self.adUnitId = adUnitId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var bannerView: GADBannerView = GADBannerView() //Creates your BannerView
 
    override func viewDidLoad() {
        bannerView.adUnitID = adUnitId
        bannerView.rootViewController = self
      
        //Add our BannerView to the VC
        view.addSubview(bannerView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadBannerAd()
    }

    //Allows the banner to resize when transition from portrait to landscape orientation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in
            self.bannerView.isHidden = true //So banner doesn't disappear in middle of animation
        } completion: { _ in
            self.bannerView.isHidden = false
            self.loadBannerAd()
        }
    }

    func loadBannerAd() {
       
        let frame = view.frame.inset(by: view.safeAreaInsets)
        let viewWidth = frame.size.width
        
        //Updates the BannerView size relative to the current safe area of device (This creates the adaptive banner)
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        
        let request = GADRequest()
        
        request.scene = self.view.window?.windowScene

        bannerView.load(request)
    }
}


*/
