//
//  genaricReusableCell.swift
//  GenaricReusableCell
//
//  Created by P D Leonard on 7/29/16.
//  Copyright © 2016 MacMeDan. All rights reserved.
//

import AVFoundation
import UIKit
import Material
import SnapKit

class GenaricCell: UITableViewCell, layoutCell {
    var avatarView = AvatarView()
    var mainLabel = UILabel()
    var subLabel = UILabel()
    var contentStackView = UIStackView()
    var centerStackView = UIStackView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        avatarView = avatarView()
        avatarView.userInteractionEnabled = false
        avatarView.pulseColor = UIColor.clearColor()
        avatarView.selected = false
        mainLabel = mainLabel()
        subLabel = subLabel()
        let verticalViews = [mainLabel, subLabel]
        centerStackView = centerStackView(verticalViews)
        prepareMainLabel()
        prepareSubLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let horizontalViews = [avatarView, centerStackView]
        contentStackView(horizontalViews)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getNoAppointmentsCell(text: String) -> MaterialTableViewCell {
        let cell = MaterialTableViewCell()
        cell.textLabel?.textAlignment = .Center
        cell.textLabel?.text = text
        cell.textLabel?.textColor = customTextColor
        
        return cell
    }
    
    func forA<T: GenaricCellable>(item: T) -> UITableViewCell {
        prepareAvatar(item)
        print(item.mainText)
        mainLabel.text = item.mainText
        subLabel.text = item.subText
        return self
    }
    
    private func prepareMainLabel() {
        mainLabel.font = MaterialFont.boldSystemFontWithSize(14)
        mainLabel.textColor = customTextColor
    }
    
    private func prepareSubLabel() {
        subLabel.font = MaterialFont.systemFontWithSize(12)
        subLabel.textColor = customTextColor
        subLabel.numberOfLines = 0
    }
    
    func prepareAvatar<T: GenaricCellable>(item: T) {
        guard let image = UIImage(named: "NiceSelfi") else {
            assertionFailure("no image")
            return
        }
        avatarView.setup(image)
    }
    
}
