//
//  Extension+TableView.swift
//  test
//
//  Created by Mohammed Saleh on 11/11/2024.
//

import Foundation
import UIKit

extension UITableView {
    
    func configureTableView<T: UITableViewCell>(delegate:UITableViewDelegate , dataSource: UITableViewDataSource , cellType: T.Type , cellIdentifier: String , typeSeparator: StyleSeparator , separatorInset: UIEdgeInsets = .zero) {
        self.delegate = delegate
        self.dataSource = dataSource
        self.register(UINib(nibName: String(describing: cellType), bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.separatorStyle =  typeSeparator.separtorStyle
        self.separatorInset = separatorInset
        self.reloadData()
    }
    
    
    enum StyleSeparator {
        case none
        case singleLine
        
        var separtorStyle: UITableViewCell.SeparatorStyle {
            switch self {
              
            case .none:
                return .none
            case .singleLine:
                return .singleLine
            }
        }
    }
    
    func dequeueCell<T: UITableViewCell>(withType type: T.Type , for indexPath: IndexPath) ->T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: type) , for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: type))")
        }
        return cell
    }
    
}
