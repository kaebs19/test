//
//  CartTVCell.swift
//  test
//
//  Created by Mohammed Saleh on 18/11/2024.
//

import UIKit

protocol CartTVCellProtocol: NSObjectProtocol {
    func plusButtonTapped(cellIndex: Int)
    func  minusButtonTapped(cellIndex: Int)
    func removeButtonTapped(cellIndex: Int)
}

class CartTVCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productNumber: UILabel!
    
    
    weak var delagate: CartTVCellProtocol?
    var cellIndex: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        delagate?.minusButtonTapped(cellIndex: cellIndex)
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        delagate?.plusButtonTapped(cellIndex: cellIndex)
    }
    
    @IBAction func removeButtonTapped(_ sender: Any) {
        delagate?.removeButtonTapped(cellIndex: cellIndex)
    }
    
}

extension CartTVCell {
    
    
    func initData(cartData:Cart) {
        productName.custmeLable(text: cartData.productName, color: .C000000_Black, ofSize: 16, typeFontStyle: .regular)
        productPrice.custmeLable(text: cartData.productPrice, color: .C000000_Black, ofSize: 16, typeFontStyle: .regular)
        productNumber.custmeLable(text: String(cartData.count), color: .C707070_DarkGray, ofSize: 16, typeFontStyle: .regular)
    }
}
