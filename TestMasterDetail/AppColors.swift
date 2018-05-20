//
//  Colors.swift
//  TestMasterDetail
//
//  Created by Ramires Moreira on 5/18/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

struct AppColors {
    
    static var blue : UIColor {
        return UIColor.blue
    }
    
    static var white : UIColor {
        return UIColor.white
    }
    
    static var green : UIColor {
        return colorRGB(32, 105, 17, alpha: 1.0)
    }
    
    private static func colorRGB(_ red : CGFloat , _ green : CGFloat, _ blue : CGFloat, alpha : CGFloat)-> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

