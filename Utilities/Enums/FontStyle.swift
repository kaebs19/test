//
//  FontStyle.swift
//  test
//
//  Created by Mohammed Saleh on 10/11/2024.
//

import Foundation
import UIKit


enum typeStyl {
    case bold
    case regular
    case medium
    case semibold
    
    var fontWeight: UIFont.Weight {
        switch self {
        case .bold:
            return .bold
        case .regular:
            return .regular
        case .medium:
            return .medium
        case .semibold:
            return .semibold
        }
    }
}
