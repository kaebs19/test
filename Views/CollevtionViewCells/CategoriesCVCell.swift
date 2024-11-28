//
//  CategoriesCVCell.swift
//  test
//
//  Created by Mohammed Saleh on 22/11/2024.
//

import UIKit

class CategoriesCVCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var categoryLable: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
        
    }

}

extension CategoriesCVCell {
    
    func initUI() {
        mainView.addRadius(radius: 10)
        mainView.addBoder(color: .CE2E2E2_LightGray, width: 1)
        
    }
    
    func initCDataCell (date cell: Category) {
        
        if cell.isSelected {
            categoryLable
                .custmeLable(
                    text: cell.title,
                    color: .C0079FB_Blue,
                    ofSize: 14,
                    typeFontStyle: .regular
                )
        } else {
            categoryLable
                .custmeLable(
                    text: cell.title,
                    color: .C000000_Black,
                    ofSize: 14,
                    typeFontStyle: .regular)
        }
    }
    
}
