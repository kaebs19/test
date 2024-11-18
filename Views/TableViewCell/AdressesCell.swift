//
//  AdressesCell.swift
//  test
//
//  Created by Mohammed Saleh on 11/11/2024.
//

import UIKit

protocol AdressesCellProtocol:NSObjectProtocol {
    func isDefaultClickedBut(index: Int)
}



class AdressesCell: UITableViewCell {
    @IBOutlet weak var tileLabel: UILabel!
    @IBOutlet weak var detalsLabel: UILabel!
    @IBOutlet weak var isDefaultImg: UIImageView!
    @IBOutlet weak var isDefaultLab: UILabel!
    
    var cellIndex: Int = 0
    weak var delagate: AdressesCellProtocol?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    @IBAction func isDefaultClickedBut(_ sender: Any) {
        delagate?.isDefaultClickedBut(index: cellIndex ?? 0)
    }
    
}


extension AdressesCell {
    
    func initUI() {
        
    }
    
    func setData(cellData: Adress) {
        tileLabel.custmeLable(text: cellData.title, color: .C000000_Black, ofSize: 14, typeFontStyle: .semibold)
        detalsLabel.custmeLable(text: cellData.details, color: .C505050_DarkGray, ofSize: 14, typeFontStyle: .regular)
        
        
        // updata colors lable or image
        let lableColer:Colors = cellData.isSelected ? .C0079FB_Blue : .CBFBFBF_LightGray
        let imageName: images = cellData.isSelected ? .DEFAULT_SELECTED : .DEFAULT_UNSELECTED
        let image: UIImage? = imageName.image
        isDefaultLab.custmeLable(text: "Default", color: lableColer, ofSize: 12, typeFontStyle: .regular)
        isDefaultImg.image = image
    }
    
}



