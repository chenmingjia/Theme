//
//  MasterTableViewCell.swift
//  Theme
//
//  Created by 陈铭嘉 on 2016/12/22.
//  Copyright © 2016年 com.Boolan. All rights reserved.
//
import UIKit
import Foundation

class MasterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func layoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.masksToBounds = true
    }
}
