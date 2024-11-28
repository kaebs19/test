//
//  AddressCVCell.swift
//  test
//
//  Created by Mohammed Saleh on 28/11/2024.
//

import UIKit

class AddressCVCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        [ mainView ].forEach { view in
            view?.addRadius(radius: 16)
            view?.addBoder(color: .C0079FB_Blue, width: 1)
        }
    }

}
