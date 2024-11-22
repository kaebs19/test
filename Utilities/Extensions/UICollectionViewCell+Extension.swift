//
//  UICOllectionViewCell+Extension.swift
//  test
//
//  Created by Mohammed Saleh on 21/11/2024.
//

import Foundation
import UIKit


extension UICollectionView {
    
    func configureCollectionViewCell<T: UICollectionViewCell> ( delegate: UICollectionViewDelegate,
                                                                dataSource: UICollectionViewDataSource ,
                                                                cellType: T.Type ,
                                                                cellName: CVCells )
    {
        self.delegate = delegate
        self.dataSource = dataSource
        self.register(
            UINib(nibName: String(describing: cellType), bundle: nil),
            forCellWithReuseIdentifier: cellName.identifier
        )
    }
    
    
    func duqeuereusableCell<T: UICollectionViewCell> (cellType: T.Type  , index: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: index) as? T else {
            
            fatalError("Could not dequeue cell with identifier: \(cellType)")
        }
        
        return cell
        
    }
    
}
