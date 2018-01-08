//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Ariel Scott-Dicker on 2017-12-11.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
	@IBOutlet var nameField: UITextField!
	@IBOutlet var serialNumberField: UITextField!
	@IBOutlet var valueField: UITextField!
	@IBOutlet var dateLabel: UILabel!
	@IBOutlet var changeDateButton: UIButton!
	@IBOutlet var imageView: UIImageView!
	
	@IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
		view.endEditing(true)
	}
	
	@IBAction func clearImageButtonTapped(_ sender: UIButton) {
		imageView.image = nil
		imageStore.deleteImage(forKey: item.itemKey)
	}
	
	@IBAction func takePicture(_ sender: UIBarButtonItem) {
		let imagePicker = UIImagePickerController()
		
		// If the device has a camera, take a picture
		// Otherwise, just pick from the photo library
		if UIImagePickerController.isSourceTypeAvailable(.camera) {
			imagePicker.sourceType = .camera
		} else {
			imagePicker.sourceType = .photoLibrary
		}
		
		imagePicker.allowsEditing = true
		imagePicker.delegate = self
		
		// Place imagePicker on the screen
		present(imagePicker, animated: true, completion: nil)
	}
	
	var item: Item! {
		didSet {
			navigationItem.title = item.name
		}
	}
	
	var imageStore: ImageStore!
	
	let numberFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.minimumFractionDigits = 2
		formatter.maximumFractionDigits = 2
		return formatter
	}()
	
	let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		formatter.timeStyle = .none
		return formatter
	}()
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		nameField.text = item.name
		serialNumberField.text = item.serialNumber
		valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
		dateLabel.text = dateFormatter.string(from: item.dateCreated)
		
		// Get the item key
		let key = item.itemKey
		
		// If there is an associated image with the item, display it on the imageView
		let imageToDisplay = imageStore.image(forKey: key)
		imageView.image = imageToDisplay
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		// Clear first responder
		view.endEditing(true)
		
		// Save changes to item
		item.name = nameField.text ?? ""
		item.serialNumber = serialNumberField.text
		
		if let valueText = valueField.text,
			let value = numberFormatter.number(from: valueText) {
			item.valueInDollars = value.intValue
		} else {
			item.valueInDollars = 0
		}
	}
	
	// UITextFieldDelegate
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	// UIImagePickerControllerDelegate
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		// Get picked image from info dictionary
		let image = info[UIImagePickerControllerEditedImage] as! UIImage
		
		// Store the image in the ImageStore for the item's key
		imageStore.setImage(image, forKey: item.itemKey)
		
		// Put that image on the screen in the imageView
		imageView.image = image
		
		// Take the imagePicker off the screen; you must call this dismiss method
		dismiss(animated: true, completion: nil)
	}
	
	// Segue
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// If the triggered segue is the "showItem" segue
		switch segue.identifier {
		case "changeDate"?:
			let changeDateViewController = segue.destination as! ChangeDateViewController
			changeDateViewController.item = item
		default:
			preconditionFailure("Unexpected segue identifier")
		}
	}
}
