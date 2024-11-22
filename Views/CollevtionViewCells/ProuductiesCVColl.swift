//
//  ProuductiesCVColl.swift
//  test
//
//  Created by Mohammed Saleh on 21/11/2024.
//

import UIKit

class ProuductiesCVColl: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.addRadius(radius: 16)
        mainView.clipsToBounds = true
    }

}
