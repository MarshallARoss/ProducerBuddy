//
//  TiltManager.swift
//  Producer Pal
//
//  Created by Marshall  on 2/15/22.
//

import Foundation
import Combine
import CoreMotion

class MotionManager: ObservableObject {

    private var motionManager: CMMotionManager

    //https://stackoverflow.com/questions/58366799/how-do-i-use-core-motion-to-output-magnetometer-data-using-swiftui
    
    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0


    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.deviceMotionUpdateInterval = 1/60
        self.motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
           
            guard error == nil else {
                print(error!)
                return
            }

            if let data = data {
                self.x = data.acceleration.x
                self.y = data.acceleration.y
                self.z = data.acceleration.z
            }

        }

    }
}
