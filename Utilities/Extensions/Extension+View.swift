//
//  Extension+View.swift
//  test
//
//  Created by Mohammed Saleh on 10/11/2024.
//

import Foundation
import UIKit

extension UIView {
    func addBoder(color: Colors, width: CGFloat) {
        layer.borderColor = color.uiColor?.cgColor
        layer.borderWidth = width
    }
    
    func addShadow(color: Colors, opacity: Float, radius: CGFloat, offset: CGSize) {
        layer.shadowColor = color.uiColor?.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
    }
    
    func addRadius(radius: CGFloat) {
        layer.cornerRadius = radius
    }
}
