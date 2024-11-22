//
//  CategoriesVC.swift
//  test
//
//  Created by Mohammed Saleh on 21/11/2024.
//

import UIKit

class CategoriesVC: UIViewController {
    
    
    @IBOutlet weak var productiesCV: UICollectionView!
    @IBOutlet weak var categoriesCVC: UICollectionView!
    
    var categoriesList = ["Ali" , "Category 2" , "Category 3" , "Category 4" , "Category five .... "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    
}

extension CategoriesVC{
    
    func initUI(){
        
        initCV(
            for: productiesCV,
            cellType: ProuductiesCVColl.self,
            cellName: .ProuductiesCVColl
        )
        
        initCV(
            for: categoriesCVC,
            cellType: CategoriesCVCell.self,
            cellName: .CategoriesCVCell
        )
    }
    
    func initCV <T: UICollectionViewCell> (for collectionView: UICollectionView ,cellType: T.Type ,cellName: CVCells) {
        
        
        collectionView
            .configureCollectionViewCell(
                delegate: self,
                dataSource: self,
                cellType: cellType,
                cellName: cellName
            )
        
        
    }
}

extension CategoriesVC: UICollectionViewDelegate {
    
    
}

extension CategoriesVC: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
            case 0:
                return categoriesList.count
                
            default:
                return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        switch collectionView.tag {
            case 0:
                
                let cell = collectionView.duqeuereusableCell(
                    cellType: CategoriesCVCell.self,
                    index: indexPath
                )
                cell.categoryLable.text = categoriesList[indexPath.row]
                
                return cell
                
            default:
                let cell = collectionView.duqeuereusableCell(
                    cellType: ProuductiesCVColl.self, index: indexPath)
                
                return cell
        }
        
        
    }
    
}
    
    extension CategoriesVC: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            
            
            
            switch collectionView.tag {
                case 0:
                    let collectionViewHeight = collectionView.bounds.height
                    let collectionViewWidth = culcualteHeight(for: categoriesList[indexPath.row])
                    
                    return CGSize(width: collectionViewWidth, height: collectionViewHeight)
                    
                default:
                    let numberOfCellsInRow: CGFloat = 2
                    let spacing = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
                    let width = floor((collectionView.bounds.width - spacing * (numberOfCellsInRow - 1)) / numberOfCellsInRow)
                    
                    return CGSize(width: width, height: width)
            }
            
        }
        
        private func culcualteHeight(for text: String) -> CGFloat {
            guard let cell = Bundle.main.loadNibNamed("CategoriesCVCell",owner: self)?.first as? CategoriesCVCell else { return 0.0 }
            cell.categoryLable.text = text
            let fittingSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: cell.bounds.height )
            let size = cell.contentView.systemLayoutSizeFitting(fittingSize)
            return size.width
        }
    }
    
    

