//
//  ThemeUtil.swift
//  Theme
//
//  Created by 陈铭嘉 on 2016/12/21.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//
import UIKit
import Foundation

extension UIView {
    
    internal func addSubviewByTheme(_ view: UIView) {
        // 1.执行原有的方法,如果类型池中已经注册，从UI控件注册表中找出对应的注册属性，
        addSubviewByTheme(view)
        guard view != nil else {
            return
        }
        print(String(describing: self.classForCoder) + "--add--" + String(describing: view.classForCoder))
        guard Theme.typePool.contains(String(describing: view.classForCoder)) else{
                return
        }
        let properties = RegistryTable.getPropertiesInType(type: String(describing: view.classForCoder))
        
        // 2.如果注册表中没有注册过相关属性，有可能是自定义控件
        guard let props = properties else { return }
        let instanceKey = ThemeUtil.addrOfP(view)
        for (key,value) in props {
            view.setValue(value.toUIProperty(), forKey: key)
            if Theme.instancePool[instanceKey] == nil {
                Theme.instancePool[instanceKey] = [(key,value)]
            } else {
                Theme.instancePool[instanceKey]?.append(key,value)
            }
        }
        if !Theme.watchers.contains(view) {
            Theme.watchers.add(view)
        }
    }
    
    internal func removeFromSuperviewByTheme() {
        self.removeFromSuperviewByTheme()
        if Theme.watchers.contains(self) {
            Theme.watchers.remove(self)
        }
        let instanceKey = ThemeUtil.addrOfP(self)
        if let _ = Theme.instancePool[instanceKey] {
            Theme.instancePool.removeValue(forKey: instanceKey)
        }
    }
    
    
}

extension CALayer {

    internal func addSublayerByTheme(_ layer: CALayer) {
        addSublayerByTheme(layer)
        guard  Theme.typePool.contains(String(describing: layer.classForCoder)) else {
            return
        }
        layer.backgroundColor = Theme.currentTheme.primaryColor.cgColor
    }
    
    internal func removeFromSuperlayerByTheme() {
        self.removeFromSuperlayerByTheme()
        if Theme.watchers.contains(self) {
            Theme.watchers.remove(self)
        }
    }
}
