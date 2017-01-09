//
//  ThemeUtil.swift
//  Theme
//
//  Created by 陈铭嘉 on 2016/12/21.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import Foundation

internal class ThemeUtil {

    internal static func methodSwizzling(type: AnyObject.Type,_ methodA: Selector,_ methodB: Selector){
        
        let originalSelector = methodA
        let swizzledSelector = methodB
        
        let originalMethod = class_getInstanceMethod(type, originalSelector)
        let swizzledMethod = class_getInstanceMethod(type,swizzledSelector)
        
        let didAddMethod = class_addMethod(type, originalSelector, method_getImplementation(originalMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(type, swizzledSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(originalMethod))
        }else{
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }

    
    static func addrOf<T>( v:inout T) -> String {
        return withUnsafePointer(to: &v) {
            return "\($0)"
        }
    }
    
    static func addrOfP(_ p: AnyObject) -> String {
        let string = "\(String(describing: p))".replacingOccurrences(of: ";", with: ":")
        return string.components(separatedBy: ":")[1]
    }
}


extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    internal class func once(token: String, block:()->Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}
