//
//  CheckoutVC.swift
//  test
//
//  Created by Mohammed Saleh on 28/11/2024.
//

import UIKit

class CheckoutVC: UIViewController {
    
    @IBOutlet weak var addressCV: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
}

extension CheckoutVC{
    
    func initUI(){
        
        initCVCell(collectionView: addressCV, cellName: .CurrentLocationCVCell)
        initCVCell(collectionView: addressCV, cellName: .NewAddressCVCell)
        initCVCell(collectionView: addressCV, cellName: .AddressCVCell)
    }
    
    func initCVCell(collectionView: UICollectionView , cellName: CVCells){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView
            .register(
                UINib(nibName: cellName.identifier, bundle: nil),
                forCellWithReuseIdentifier: cellName.identifier
            )
    }
}

extension CheckoutVC: UICollectionViewDelegate{
    
}

extension CheckoutVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
            case 0:
                let cell = collectionView.duqeuereusableCell(
                    cellType: CurrentLocationCVCell.self,
                    cellName: .CurrentLocationCVCell,
                    index: indexPath
                )
                return cell
            case 1:
                let cell = collectionView.duqeuereusableCell(
                    cellType: NewAddressCVCell.self,
                    cellName: .NewAddressCVCell,
                    index: indexPath
                )
                return cell

            default:
                let cell = collectionView.duqeuereusableCell(
                    cellType: AddressCVCell.self,
                    cellName: .AddressCVCell,
                    index: indexPath
                )
                return cell

            }
        }
        
    

    
}

extension CheckoutVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewHeight = collectionView.bounds.height

        switch indexPath.item {
                
            case 0 , 1:
                return CGSize(
                    width: collectionViewHeight * 0.7078651685 ,
                    height: collectionViewHeight
                )
        
            default:
                return CGSize(
                    width: collectionViewHeight*1.4606741573,
                    height: collectionViewHeight
                )
        }
    }
    
}
