//
//  ThemeStyle.swift
//  Theme
//
//  Created by 陈铭嘉 on 2016/12/21.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//
import UIKit
import Foundation

class ThemeDesign {
    var name: String
    var primaryColor: UIColor
    var successColor: UIColor
    var warningColor: UIColor
    var lightColor: UIColor
    var baseColor: UIColor
    var baseTextColor: UIColor
    var primaryFont: UIFont
    static var customStyles: [String : ThemeDesign] = [:]
    static var defaultStyle = ThemeDesign()
    
    init() {
        name = "defaultDesign"
        primaryColor = UIColor(red: 46/255.0, green: 144/255.0, blue: 254/255.0, alpha: 1)
        baseColor = UIColor(red: 38/255.0, green: 48/255.0, blue: 69/255.0, alpha: 1)
        baseTextColor = UIColor(red: 147/255.0, green: 158/255.0, blue: 175/255.0, alpha: 1)
        successColor = UIColor(red: 19/255.0, green: 206/255.0, blue: 102/255.0, alpha: 1)
        warningColor = UIColor(red: 247/255.0, green: 186/255.0, blue: 42/255.0, alpha: 1)
        lightColor = UIColor(red: 110/255.0, green: 149/255.0, blue: 218/255.0, alpha: 1)
        primaryFont = UIFont(name: "Arial", size: 50)!
    }
    
    init(name: String,primary: UIColor,success: UIColor,warning: UIColor,light: UIColor, base: UIColor, baseText: UIColor,primaryFont: UIFont) {
        self.name = name
        self.primaryColor = primary
        self.successColor = success
        self.warningColor = warning
        self.lightColor = light
        self.baseColor = base
        self.baseTextColor = baseText
        self.primaryFont = primaryFont
    }
    
    static func softStyle() -> ThemeDesign {
        return ThemeDesign(name: "soft", primary: .red, success: .red, warning: .red, light: .red, base:.red, baseText: .red,primaryFont: UIFont(name: "Arial", size: 20)!)
    }
}

enum ThemeStyles: String {
    case defaultSetting
    case soft
    case hard
}
