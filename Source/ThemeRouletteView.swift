//
//  ThemeRoulette.swift
//  Theme
//
//  Created by 陈铭嘉 on 2016/12/23.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//

import UIKit

class ThemeRouletteView: UIButton {
    
    var defaultRadius : CGFloat = 40
    var buttons : [UIButton] = []
    var stackView : UIStackView = UIStackView()
    
    init() {
        Theme.register(ThemeRouletteView.self)
        super.init(frame: CGRect.zero)
        frame.size.width = defaultRadius * 2
        frame.size.height = defaultRadius * 2
        layer.cornerRadius = defaultRadius
        addTarget(self, action: #selector(onSettingsButtonTap), for: .touchUpInside)
        putButtonsIntoStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func putButtonsIntoStackView() {
        for _ in 0...4 {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            button.layer.cornerRadius = 15
            button.addTarget(self, action: #selector(switchStyle), for: .touchUpInside)
            buttons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    func switchStyle() {
        
    }
    
    func onSettingsButtonTap() {
        UIView.animate(withDuration: 0.3) {
            self.buttons.forEach {
                $0.isHidden = !$0.isHidden
            }
        }
    }
    
    override func layoutSubviews() {
        stackView.axis = .vertical
        stackView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height + 10, width: 80, height: 190)
        stackView.distribution = .fillEqually
        stackView.spacing = 10
 
        print(stackView.frame)
        stackView.backgroundColor = UIColor.blue
        UIApplication.shared.keyWindow?.addSubview(stackView)
    }
}
