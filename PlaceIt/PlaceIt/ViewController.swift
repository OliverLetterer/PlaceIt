//
//  ViewController.swift
//  PlaceIt
//
//  Created by Oliver Letterer on 02.08.14.
//  Copyright (c) 2014 Sparrow-Labs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!

        if !cell {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
            cell.accessoryType = .DisclosureIndicator
        }

        cell.textLabel.text = "Example \(indexPath.row)"

        return cell
    }

    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        switch indexPath.row {
        case 0:
            navigationController.pushViewController(FirstExampleViewController(), animated: true)
        case 1:
            navigationController.pushViewController(SecondExampleViewController(), animated: true)
        default:
            abort()
        }
    }
}

