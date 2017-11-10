//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Ariel Scott-Dicker on 2017-11-07.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
	var itemStore: ItemStore!
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itemStore.allItems.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// Create an instance of UITableViewCell, with default appearance
		let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
		
		// Set the text on the cell with the description of the item that is at the nth index of 'items', where n equals the row this cell will appear
		// in on the tableView
		let item = itemStore.allItems[indexPath.row]
		
		cell.textLabel?.text = item.name
		cell.detailTextLabel?.text = "$\(item.valueInDollars)"
		
		return cell
	}
}
