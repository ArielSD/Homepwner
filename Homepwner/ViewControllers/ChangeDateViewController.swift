//
//  ChangeDateViewController.swift
//  Homepwner
//
//  Created by Ariel Scott-Dicker on 2018-01-06.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ChangeDateViewController: UIViewController {
	@IBOutlet var datePicker: UIDatePicker!
	
	var item = Item()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		datePicker.datePickerMode = .date
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		item.dateCreated = datePicker.date
	}
}
