//
//  CVCells+Enum.swift
//  test
//
//  Created by Mohammed Saleh on 21/11/2024.
//

import Foundation


enum CVCells: String{
    
    case ProuductiesCVColl = "ProuductiesCVColl"
    case CategoriesCVCell = "CategoriesCVCell"
    
    var identifier: String{
        return self.rawValue
    }
}
