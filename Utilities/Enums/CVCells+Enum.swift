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
    case SliderCVCellHome = "SliderCVCellHome"
    case CategoriesCVCellHome = "CategoriesCVCellHome"
    case ProductsCVCellHome = "ProductsCVCellHome"
    case AddressCVCell = "AddressCVCell"
    case CurrentLocationCVCell = "CurrentLocationCVCell"
    case NewAddressCVCell = "NewAddressCVCell"
    
    var identifier: String{
        return self.rawValue
    }
}
