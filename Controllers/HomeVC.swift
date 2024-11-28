//
//  HomeVC.swift
//  test
//
//  Created by Mohammed Saleh on 25/11/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var  sliderCV: UICollectionView!
    @IBOutlet weak var categoryCV: UICollectionView!
    @IBOutlet weak var productsCV: UICollectionView!
    @IBOutlet weak var sliderPageControl: UIPageControl!
    
    // MARK: - Variables
    var sliderList =  ["slider1_img" , "slider2_img" , "slider3_img" , "slider4_img"]
    var currintPageIndex: Int = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
}

extension HomeVC{
    func initUI(){
        sliderPageControl.numberOfPages = sliderList.count
        initTimer()
        
        initCV(
            for: sliderCV,
            cellType: SliderCVCellHome.self,
            cellName: .SliderCVCellHome
        )
        
        initCV(
            for: categoryCV,
            cellType: CategoriesCVCell.self,
            cellName: .CategoriesCVCellHome
        )
        initCV(
            for: productsCV,
            cellType: ProductsCVCellHome.self,
            cellName: .ProductsCVCellHome
        )
    }
    
    func initTimer() {
        timer = Timer
            .scheduledTimer(
                timeInterval: 3.5,
                target: self,
                selector: #selector(moverslider),
                userInfo: nil,
                repeats: true
            )
    }
    
    @objc func moverslider(){
        print("Done")
        currintPageIndex = (
            currintPageIndex>sliderList.count - 1) ? currintPageIndex + 1 : 0
        sliderCV
            .scrollToItem(
                at: IndexPath(item: currintPageIndex, section: 0),
                at: .centeredHorizontally,
                animated: true
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


extension HomeVC:  UICollectionViewDelegate {
    
}

extension HomeVC:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
            case 0 :
                return sliderList.count
                
            case 1:
                
                return 12
                
            case _ :
                return 8
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
            case 0 :
                let cell = collectionView
                    .duqeuereusableCell(
                        cellType: SliderCVCellHome.self, cellName: .SliderCVCellHome,
                        index: indexPath
                    )
                cell.sliderImg.image = UIImage(
                    named: sliderList[indexPath.item]
                )
                return cell
                
            case 1:
                let cell = collectionView.duqeuereusableCell(
                    cellType: CategoriesCVCellHome.self, cellName: .CategoriesCVCellHome,
                    index: indexPath
                )
                return cell
                
            default:
                let cell = collectionView.duqeuereusableCell(
                    cellType: ProductsCVCellHome.self, cellName: .ProductsCVCellHome,
                    index: indexPath
                )
                return cell
        }
    }

    
}


extension HomeVC:  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        
        switch collectionView.tag {
            case 0:
                let collectionViewwidth = collectionView.bounds.width
                let collectionViewHeight = collectionView.bounds.height
                return CGSize( width: collectionViewwidth, height: collectionViewHeight )
                
            case 1:
                let collectionViewWidth = collectionView.bounds.width
                
                let numberOfCellsInRow:CGFloat = 2
             //   let collectionViewHwight = collectionView.bounds.width
                let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
                let spacingBetweenCells = flowLayout.minimumInteritemSpacing * (numberOfCellsInRow - 1)
                let adjustedWidth = collectionViewWidth - spacingBetweenCells
                let width = floor(adjustedWidth/numberOfCellsInRow)
                return CGSize(width: width, height: width * 0.6993464052)
                            
            default:
                let collectionViewWidth = collectionView.bounds.width
                let collectionViewHeight = collectionView.bounds.height
                return CGSize( width: collectionViewWidth, height: collectionViewHeight )
                
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == sliderCV {
            currintPageIndex = Int(
                scrollView.contentOffset.x / sliderCV.bounds.width
            )
            sliderPageControl.currentPage = currintPageIndex
        }
        
    }
}
