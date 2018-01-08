//
//  ImageStore.swift
//  Homepwner
//
//  Created by Ariel Scott-Dicker on 2018-01-08.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ImageStore {
	let cache = NSCache<NSString, UIImage>()
	
	func setImage(_ image: UIImage, forKey key: String) {
		cache.setObject(image, forKey: key as NSString)
	}
	
	func image(forKey key: String) -> UIImage? {
		return cache.object(forKey: key as NSString)
	}
	
	func deleteImage(forKey key: String) {
		cache.removeObject(forKey: key as NSString)
	}
}
