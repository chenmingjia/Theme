//
//  ThemePool.swift
//  Theme
//
//  Created by 陈铭嘉 on 2016/12/20.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit



class Theme {

    var primaryColor: UIColor
    static var typePool: Set<String> = [] //类型绑定池
    static var instancePool: [String:[(String,Levelable)]] = [:] //实例绑定池[实例地址，属性数组]
    static var currentTheme: ThemeDesign = ThemeDesign() //当前样式
    static var styles: Dictionary<String,ThemeDesign> = ["soft":ThemeDesign.softStyle()] //默认提供的样式集合
    static var watchers: NSMutableArray = [] //订阅者们[实例指针]
    
    private init() {
        self.primaryColor = Theme.currentTheme.primaryColor
    }
    
    init(primaryColor: UIColor) {
        self.primaryColor = primaryColor
    }
    
    static func switchStyle(_ style: ThemeStyles) {
        guard let design = styles[style.rawValue] else {
            return
        }
        currentTheme = design
        for watcher in watchers {
            let watcher = watcher as AnyObject
            let instanceKey = "\(ThemeUtil.addrOfP(watcher))"
            if let props = instancePool[instanceKey] {
                for (propName,propValue) in props {
                    (watcher as AnyObject).setValue(propValue.toUIProperty(), forKey: propName)
                }
            }
        }
    }
    
    //类型订阅 -- UIView子类
    static func register(_ viewType: UIView.Type) {
        DispatchQueue.once(token: String(describing: Theme.self)+"UIView", block:{
            ThemeUtil.methodSwizzling(type: UIView.self, #selector(UIView.self.addSubview(_:)), #selector(UIView.self.addSubviewByTheme(_:)))
            ThemeUtil.methodSwizzling(type: UIView.self, #selector(UIView.self.removeFromSuperview), #selector(UIView.self.removeFromSuperviewByTheme))
        })
        if !typePool.contains(String(describing: viewType)) {
            typePool.insert(String(describing: viewType))
        }
    }
    
    //类型订阅 -- CALayer子类
    static func register(_ layerType: CALayer.Type) {
        DispatchQueue.once(token: String(describing: Theme.self)+"CALayer", block:{
            ThemeUtil.methodSwizzling(type: CALayer.self, #selector(CALayer.self.addSublayer(_:)), #selector(CALayer.self.addSublayerByTheme(_:)))
        })
        if !typePool.contains(String(describing: layerType)) {
            typePool.insert(String(describing: layerType))
        }
    }
    
    //实例订阅 -- 用NSObject实例的属性名
    static func register(_ view: NSObject, propertyName: String,level: Levelable) {
        var view = view
        let appcClass = NSClassFromString("_UIAppearance")
        
        guard !view.isKind(of: appcClass!) else{
            return
        }
        let instanceKey = ThemeUtil.addrOfP(view)
        let propTuple  = ("\(propertyName)",level)
        if Theme.instancePool[instanceKey] == nil {
            Theme.instancePool[instanceKey] = [propTuple]
            view.setValue(level.toUIProperty(), forKey: propertyName)
        }
        if !Theme.watchers.contains(view) {
            Theme.watchers.add(view)
        }
    }
    
    //显示测试轮盘
    static func testByRoulette() {
        let roulette = ThemeRouletteView()
        let screenSize = UIScreen.main.bounds.size
        roulette.center = CGPoint(x: screenSize.width-70, y: 120)
        UIApplication.shared.keyWindow?.addSubview(roulette)
    }
    
    //设置自定义类型风格
    static func setCustomStyle(style: ThemeDesign) {
        guard !styles.keys.contains(style.name) else{
           return
        }
        styles[style.name] = style
    }
    
    //切换自定义类型风格
    static func switchCustomStyle(name: String) {
        var dic = styles
        guard let design = styles[name] else {
            return
        }
        currentTheme = design
        for watcher in watchers {
            let watcher = watcher as AnyObject
            let instanceKey = "\(ThemeUtil.addrOfP(watcher))"
            if let props = instancePool[instanceKey] {
                for (propName,propValue) in props {
                    (watcher as AnyObject).setValue(propValue.toUIProperty(), forKey: propName)
                }
            }
        }
    }
    
    
}







