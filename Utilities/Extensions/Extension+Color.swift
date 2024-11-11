//
//  Extension+UIColor.swift
//  test
//
//  Created by Mohammed Saleh on 10/11/2024.
//

import Foundation
import UIKit


extension UIColor {
    convenience init?(hex: String) {
        // تنظيف النص والتأكد من طوله
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // إزالة العلامة # إذا كانت موجودة
        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }
        
        // التحقق من الطول (إما 6 أو 8 حروف)
        guard hexFormatted.count == 6 || hexFormatted.count == 8 else {
            return nil
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        // تقسيم القيمة إلى اللون الأحمر والأخضر والأزرق والشفافية إذا كان هناك 8 حروف
        let red, green, blue, alpha: CGFloat
        if hexFormatted.count == 6 {
            red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgbValue & 0x0000FF) / 255.0
            alpha = 1.0
        } else {
            red = CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
            green = CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0
            alpha = CGFloat(rgbValue & 0x000000FF) / 255.0
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
