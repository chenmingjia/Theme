//
//  ViewController.swift
//  Theme
//
//  Created by 陈铭嘉 on 2016/12/20.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var newView: UIButton? = nil
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 400, width: 300, height: 300))
        button.setTitle("Hello", for: .normal)
        Theme.register(UIButton.self)
        button.addTarget(self, action: #selector(ViewController.do(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.titleLabel?.font = UIFont(name: "Arial", size: 50)
        
        Theme.register(button.titleLabel!, propertyName: "font", level: FontLevel.primary)
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    }

    @IBAction func `do`(_ sender: Any) {
//        Theme.switchStyle(.soft)
        let s = CustomStyle()
        Theme.setCustomStyle(style: s)
        Theme.switchCustomStyle(name: s.name)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

