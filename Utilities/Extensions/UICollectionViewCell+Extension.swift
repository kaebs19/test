//
//  UICOllectionViewCell+Extension.swift
//  test
//
//  Created by Mohammed Saleh on 21/11/2024.
//

import Foundation
import UIKit


extension UICollectionView {
    
    func configureCollectionViewCell ( delegate: UICollectionViewDelegate,
                                                                dataSource: UICollectionViewDataSource ,
                                                                cellName: CVCells )
    {
        self.delegate = delegate
        self.dataSource = dataSource
        self.register(
            UINib(nibName: cellName.identifier, bundle: nil),
            forCellWithReuseIdentifier: cellName.identifier
        )
    }
    
    
    func duqeuereusableCell<T: UICollectionViewCell> (cellType: T.Type, cellName: CVCells  , index: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellName.identifier, for: index) as? T else {
            
            fatalError("Could not dequeue cell with identifier: \(cellType)")
        }
        
        return cell
        
    }
    
}
