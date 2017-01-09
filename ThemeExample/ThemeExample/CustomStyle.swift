//
//  CustomStyle.swift
//  ThemeExample
//
//  Created by 陈铭嘉 on 2017/1/9.
//  Copyright © 2017年 com.Boolan. All rights reserved.
//

import UIKit

class CustomStyle: ThemeDesign {

    override init() {
        super.init()
        name = "magic"
        primaryColor = .yellow
        baseColor = .yellow
        baseTextColor = .yellow
        successColor = .yellow
        warningColor = .yellow
        lightColor = .yellow
        primaryFont = UIFont(name: "Arial", size: 50)!
    }
}
