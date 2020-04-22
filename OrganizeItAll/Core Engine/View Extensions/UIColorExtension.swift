//
//  UIColorExtension .swift
//  OrganizeItAll
//
//  Created by MOYA RICHARDS on 3/14/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//

import UIKit



//https://www.reddit.com/r/swift/comments/610xby/swift_3_uicolor_utilities_for_random_color_and/dfbotgb/
extension UIColor {
    static func randomColor(saturation: CGFloat = 1, brightness: CGFloat = 1, alpha: CGFloat = 1) -> UIColor {
        let hue = CGFloat(arc4random_uniform(361)) / 360.0
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
}
