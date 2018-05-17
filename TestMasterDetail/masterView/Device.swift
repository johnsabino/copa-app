//
//  Device.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 17/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

struct Device {
    static var isPhone : Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var isPad : Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isPortrait : Bool {
        return UIApplication.shared.statusBarOrientation.isPortrait
    }
    
    static var isLandscape : Bool {
        return UIApplication.shared.statusBarOrientation.isLandscape
    }
} 

