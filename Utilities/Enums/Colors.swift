//
//  Colors.swift
//  test
//
//  Created by Mohammed Saleh on 10/11/2024.
//

import UIKit


enum Colors: String {
    case CFFFFFF_Wihte = "#FFFFFF"
    case C989898_Gray = "#C989898"
    case C000000_Black = "#000000"
    case CDB0000_Red = "#DB0000"
    case C24955C_Green = "#24955C"
    case C0079FB_Blue = "#0079FB"
    case C58595B_LightGray = "#58595B"
    case CD9D9D9_DarkGray = "#D9D9D9"
    case C505050_DarkGray = "#505050"
    case CBFBFBF_LightGray = "#CBFBFBF"
    case C707070_DarkGray = "#707070"
    case CE2E2E2_LightGray = "#E2E2E2"
    
    var uiColor: UIColor? {
        UIColor(hex: self.rawValue)
    }

}



