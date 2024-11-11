//
//  Extension+Lable.swift
//  test
//
//  Created by Mohammed Saleh on 10/11/2024.
//

import UIKit

extension UILabel {
    func custmeLable(text: String? , color: Colors  , ofSize: CGFloat , typeFontStyle:typeStyl) {
        self.text = text
        self.textColor = color.uiColor
        self.font = .systemFont(ofSize: ofSize, weight: typeFontStyle.fontWeight)
    }
}
