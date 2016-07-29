//
//  DemoData.swift
//  GenaricReusableCell
//
//  Created by P D Leonard on 7/29/16.
//  Copyright © 2016 MacMeDan. All rights reserved.
//

import UIKit

// Mark: Demo Purposes only 

// This is an example of seting up data to feed into our table.

func getListOfPlayers() -> [Player] {
    var players = [Player]()
    players.append(Player(ID: "1", subText: "Nija Worior", firstName: "Peter", lastName: "Piper"))
    return players
}
