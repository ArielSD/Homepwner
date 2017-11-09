//
//  ItemStore.swift
//  Homepwner
//
//  Created by Ariel Scott-Dicker on 2017-11-08.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemStore {
	var allItems = [Item]()
	
	init() {
		for _ in 0..<5 {
			createItem()
		}
	}
	
	@discardableResult func createItem() -> Item {
		let newItem = Item(random: true)
		allItems.append(newItem)
		return newItem
	}
}
