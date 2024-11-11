//
//  OrdersCell.swift
//  test
//
//  Created by Mohammed Saleh on 10/11/2024.
//

import UIKit

class OrdersCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var orderNumberLab: UILabel!
    @IBOutlet weak var orderDateLab: UILabel!
    @IBOutlet weak var orderStatusLab: UILabel!
    @IBOutlet weak var orderPriceLab: UILabel!
    @IBOutlet weak var orderImage: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
}


extension OrdersCell {
    
    func initUI() {
        mainView.addBoder(color: .CD9D9D9_DarkGray, width: 1)
        mainView.addRadius(radius: 10)
        mainView.backgroundColor = Colors.CFFFFFF_Wihte.uiColor
    }
    
    func initData(with order: Orders) {
        orderNumberLab.custmeLable(text: order.orderNumber,
                                   color: .C58595B_LightGray,
                                   ofSize: 14,
                                   typeFontStyle: .regular)
        orderDateLab.custmeLable(text: order.orderDate, color: .C989898_Gray, ofSize: 14, typeFontStyle: .regular)
        orderPriceLab.custmeLable(text: order.orderPrice, color: .C0079FB_Blue, ofSize: 14, typeFontStyle: .bold)
        
        var color: Colors
        var image: UIImage? = UIImage(named: "Path")
        var statusText: String
        
        switch order.orderStatus {
            
        case .pending:
            statusText = "pending"
            color = .C24955C_Green
        case .processing:
            statusText = "processing"
            color = .C0079FB_Blue
            
        case .shipped:
            statusText = "shipped"
            color = .C000000_Black
            
        case .cancelled:
            statusText = "cancelled"
            color = .CDB0000_Red
            
        }
        
        orderStatusLab.custmeLable(text: statusText,
                                   color: color,
                                   ofSize: 14, typeFontStyle: .regular)
        orderImage.image = image
        orderImage.tintColor = color.uiColor
        
        
    }
    
}
