//
//  images.swift
//  test
//
//  Created by Mohammed Saleh on 13/11/2024.
//

import Foundation
import UIKit

enum images: String {
    
    case DEFAULT_SELECTED = "select"
    case DEFAULT_UNSELECTED = "unSelect"
    
    var image: UIImage?  {
        UIImage(named: self.rawValue) ?? UIImage()
    }
}
