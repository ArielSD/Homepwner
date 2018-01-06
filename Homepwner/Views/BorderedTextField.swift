//
//  BorderedTextField.swift
//  Homepwner
//
//  Created by Ariel Scott-Dicker on 2018-01-06.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

import UIKit

class BorderedTextField: UITextField {
	override func becomeFirstResponder() -> Bool {
		super.becomeFirstResponder()
		self.borderStyle = .bezel
		return true
	}
	
	override func resignFirstResponder() -> Bool {
		super.resignFirstResponder()
		self.borderStyle = .roundedRect
		return true
	}
}
