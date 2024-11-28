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
    
    var categoriesList: [Category] = [
        Category(title: "Ali", isSelected: true ) ,
        Category(title: "Category one ", isSelected: false ) ,
        Category(title: "Category two", isSelected: false ) ,
        Category(title: "Category three", isSelected: false ),
        Category(title: "Category three", isSelected: false ),
        Category(title: "Category three", isSelected: false )

                 ]
    
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
        
        
        collectionView.configureCollectionViewCell(
            delegate: self,
            dataSource: self,
            cellName: cellName
        )
        
        
    }
}

extension CategoriesVC: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        for index in 0..<categoriesList.count {
            categoriesList[index].isSelected = false
        }
        categoriesList[indexPath.row].isSelected = true
        categoriesCVC.reloadData()
    }
    
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
                    cellType: CategoriesCVCell.self, cellName: .CategoriesCVCell,
                    index: indexPath
                )
                let dataCategory = categoriesList[indexPath.row]
                cell.initCDataCell(date: dataCategory)
                return cell
                
            default:
                let cell = collectionView.duqeuereusableCell(
                    cellType: ProuductiesCVColl.self, cellName: .ProductsCVCellHome, index: indexPath)
                
                return cell
        }
        
        
    }
    
}

extension CategoriesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        
        switch collectionView.tag {
            case 0:
                let collectionViewHeight = collectionView.bounds.height
                let collectionViewWidth = culcualteHeight(
                    for: categoriesList[indexPath.row].title
                )
                
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



