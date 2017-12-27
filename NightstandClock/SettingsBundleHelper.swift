//
//  SettingsBundleHelper.swift
//  NightstandClock
//
//  Created by Stephen Testen on 12/26/17.
//  Copyright © 2017 Stephen Testen. All rights reserved.
//

import Foundation
import UIKit
class SettingsBundleHelper {
    
    struct SettingsBundleKeys {
        static let HourFormatKey = "hour_format_preference"
        static let ColorKey = "color_preference"
        static let AlphaKey = "alpha_preference"
    }
    
    func GetIsTwentyFourHourFormat() -> Bool {
        return UserDefaults.standard.bool(forKey: SettingsBundleKeys.HourFormatKey)
    }
    
    func SetIsTwentyFourHourFormat(isTwentyFourHourFormat: Bool) {
        UserDefaults.standard.set(isTwentyFourHourFormat, forKey: SettingsBundleKeys.HourFormatKey)
    }
    
    func GetColor() -> UIColor {
        let colorValue = UserDefaults.standard.string(forKey: SettingsBundleKeys.ColorKey)
        
        switch colorValue {
        case "0"?:
            return UIColor.blue
        case "1"?:
            return UIColor.brown
        case "2"?:
            return UIColor.cyan
        case "3"?:
            return UIColor.green
        case "4"?:
            return UIColor.magenta
        case "5"?:
            return UIColor.orange
        case "6"?:
            return UIColor.purple
        case "7"?:
            return UIColor.red
        case "9"?:
            return UIColor.yellow
        default:
            return UIColor.white
        }
    }
    
    func GetAlpha() -> CGFloat {
        return CGFloat(UserDefaults.standard.float(forKey: SettingsBundleKeys.AlphaKey))
    }
    
    func SetAlpha(alpha: CGFloat) {
        UserDefaults.standard.set(alpha, forKey: SettingsBundleKeys.AlphaKey)
    }
}
