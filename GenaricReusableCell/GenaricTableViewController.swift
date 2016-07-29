//
//  GenaricTableViewController.swift
//  GenaricReusableCell
//
//  Created by P D Leonard on 7/29/16.
//  Copyright © 2016 MacMeDan. All rights reserved.
//

import UIKit

let cellReuseIdentifier = "cell"

class GenaricTableViewController: UITableViewController {
       
    var players = getListOfPlayers()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.registerClass(GenaricCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        players = getListOfPlayers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       print(players.count)
        return players.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as? GenaricCell else {
            assertionFailure("No cell")
            return UITableViewCell()
        }
    
        let player = players[indexPath.row]
        cell.forA(player)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.setSelected(false, animated: true)
    }
    
}
