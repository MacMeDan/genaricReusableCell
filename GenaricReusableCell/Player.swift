//
//  DemoData.swift
//  GenaricReusableCell
//
//  Created by P D Leonard on 7/29/16.
//  Copyright © 2016 MacMeDan. All rights reserved.
//
// The players Struct conforms to our GenearicCellable Protocol which ensures that
// anything that is a Palyer<Type> has all the things we need for our GenaricCell
//

import UIKit

struct Player: GenaricCellable {
    var ID: String
    var subText: String
    var firstName: String
    var lastName: String
    var mainText: String { return firstName + " " + lastName  }
}
