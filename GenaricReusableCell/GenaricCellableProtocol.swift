//
//  genaricCellable.swift
//  GenaricReusableCell
//
//  Created by P D Leonard on 7/29/16.
//  Copyright © 2016 MacMeDan. All rights reserved.
//

protocol GenaricCellable {
    var ID: String { get }
    var mainText: String { get }
    var subText: String { get }
    var firstName: String { get }
    var lastName: String { get }
}