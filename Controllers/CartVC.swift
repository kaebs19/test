//
//  CartVC.swift
//  test
//
//  Created by Mohammed Saleh on 18/11/2024.
//

import UIKit

class CartVC: UIViewController {
    
    @IBOutlet weak var cartTV: UITableView!

    
    var cartList: [Cart] = [
        Cart(productName: "Egyption Medical Headsets", productPrice: "6.34 kwd", count: 1),
        Cart(productName: "Chines Thermomerers", productPrice: "6.34 kwd", count: 1),
        Cart(productName: "National Blood Glucose", productPrice: "6.34 kwd", count: 1)

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

    }
    

}

extension CartVC{
    func initUI() {
        initTV(tv: cartTV)
    }
    
    func initTV(tv: UITableView) {
        tv.configureTableView(delegate: self, dataSource: self, cellType: CartTVCell.self, cellIdentifier: .CartTVCell, typeSeparator: .singleLine ,separatorInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
}

extension CartVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: CartTVCell.self, for: indexPath)
        let data = cartList[indexPath.row]
        cell.initData(cartData: data)
        cell.cellIndex = indexPath.row
        cell.delagate = self
        return  cell
    }
    
    
}

extension CartVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
}

extension CartVC: CartTVCellProtocol {
    func plusButtonTapped(cellIndex: Int) {
        cartList[cellIndex].count += 1
        cartTV.reloadData()
    }
    
    func minusButtonTapped(cellIndex: Int) {
        let count = cartList[cellIndex].count
        
        if count > 1 {
            cartList[cellIndex].count -= 1
            cartTV.reloadRows(at: [IndexPath(row: cellIndex, section: 0)], with: .none)
        } else {
            removeButtonTapped(cellIndex: cellIndex)
        }
    }

    func removeButtonTapped(cellIndex: Int) {
        cartList.remove(at: cellIndex)
        cartTV.reloadData()
    }
    
    
    
}
