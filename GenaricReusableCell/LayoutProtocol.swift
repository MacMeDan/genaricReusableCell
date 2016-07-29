//
//  LayoutProtocol.swift
//  GenaricReusableCell
//
//  Created by P D Leonard on 7/29/16.
//  Copyright © 2016 MacMeDan. All rights reserved.
//

import UIKit
import Material
import SnapKit

// This protocol helps to give a consistant look for table view cells that have an img, text, detailText and a date label
protocol layoutCell {
    func avatarView() -> AvatarView
    func mainLabel() -> UILabel
    func subLabel() -> UILabel
    func dateLabel() -> UILabel
    func centerStackView(verticalViews: [UIView]) -> UIStackView
    func contentStackView(horizontalViews: [UIView])
}

public let customTextColor = UIColor.colorRGB(83, greenValue: 82, blueValue: 82, alpha: 1)

extension layoutCell where Self: UITableViewCell {
    
    
    func avatarView() -> AvatarView {
        let avatarView = AvatarView()
        avatarView.snp_makeConstraints { (make) -> Void in
            let size = 50
            make.width.equalTo(size)
            make.height.equalTo(size)
        }
        return avatarView
    }
    
    func mainLabel() -> UILabel {
        let label = UILabel()
        label.font = MaterialFont.boldSystemFontWithSize(14)
        label.textColor = UIColor.colorRGB(225, greenValue: 220, blueValue: 200, alpha: 1)
        return label
    }
    
    func subLabel() -> UILabel {
        let label = UILabel()
        label.font = MaterialFont.systemFontWithSize(12)
        label.textColor = customTextColor
        return label
    }
    
    func dateLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .Right
        label.font = MaterialFont.boldSystemFontWithSize(11)
        label.textColor = customTextColor
        return label
    }
    
    func centerStackView(verticalViews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: verticalViews)
        stackView.axis = .Vertical
        stackView.distribution = .FillEqually
        stackView.alignment = .Leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    func contentStackView(horizontalViews: [UIView]) {
        let stackView = UIStackView(arrangedSubviews: horizontalViews)
        stackView.axis = .Horizontal
        stackView.distribution = .Fill
        stackView.alignment = .Center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.left.equalTo(contentView).offset(20)
            make.right.equalTo(contentView).offset(-30)
        }
    }
}