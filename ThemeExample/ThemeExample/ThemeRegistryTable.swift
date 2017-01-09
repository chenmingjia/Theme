//
//  ThemeRegistryTable.swift
//  Theme
//
//  Created by 陈铭嘉 on 2016/12/22.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//
import UIKit
import Foundation

protocol Levelable {
    func toUIProperty() -> Any
}

enum FontLevel:Levelable {
    case primary
    case base

    func toUIProperty() -> Any {
        switch self {
        case .primary:
            return Theme.currentTheme.primaryFont
        default:
            return UIFont()
        }
    }
}

enum ColorLevel:Levelable {
    case primary
    case base
    case baseText
    case primaryText
    case light
    
    func toUIProperty() -> Any {
        
        switch self {
        case .primary:
            return Theme.currentTheme.primaryColor
        case .primaryText:
            return UIColor.white
        case .base:
            return Theme.currentTheme.baseColor
        case .baseText:
            return Theme.currentTheme.baseTextColor
        case .light:
            return Theme.currentTheme.lightColor
        default:
            return UIColor.white
        }
    }
}

class RegistryTable {
    
    static var _registrytable : [String:[String:Levelable]] = [
        "UIButton":[
            "backgroundColor" : ColorLevel.primary
        ],
        "UITabBar":[
            "barTintColor" : ColorLevel.base,
            "tintColor" : ColorLevel.baseText
        ],
        "UINavigationBar" : [
            "barTintColor" : ColorLevel.primary,
            "tintColor" : ColorLevel.primaryText
        ],
        "ThemeRouletteView" : [
            "backgroundColor" : ColorLevel.primary
        ]
    ]
    

    static func getPropertiesInType(type: String) -> [String: Levelable]? {
        print(type)
        guard let props = _registrytable[type]  else {
            return nil
        }
        return props
    }
}



