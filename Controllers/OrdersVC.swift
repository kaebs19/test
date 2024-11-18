//
//  ViewController.swift
//  test
//
//  Created by Mohammed Saleh on 10/11/2024.
//

import UIKit

class OrdersVC: UIViewController {
    
    @IBOutlet weak var ordersTV: UITableView!
    
    var orders: [Orders] = [
        Orders(orderDate: "09/10/2019", orderNumber: "Order No. 105", orderStatus: .pending, orderPrice: "450.630 KWD"),
        Orders(orderDate: "09/10/2019", orderNumber: "Order No. 105", orderStatus: .processing, orderPrice: "450.630 KWD"),
        Orders(orderDate: "09/10/2019", orderNumber: "Order No. 105", orderStatus: .cancelled, orderPrice: "450.630 KWD"),
        Orders(orderDate: "09/10/2019", orderNumber: "Order No. 105", orderStatus: .pending, orderPrice: "450.630 KWD"),
        Orders(orderDate: "09/10/2019", orderNumber: "Order No. 105", orderStatus: .processing, orderPrice: "450.630 KWD")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI(tv: ordersTV)
    }


}

extension OrdersVC{
    
    func initUI(tv: UITableView){
        tv.configureTableView(delegate: self, dataSource: self, cellType: OrdersCell.self, cellIdentifier: .OrdersCell, typeSeparator: .none )
        
    }
    
}


extension OrdersVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: OrdersCell.self, for: indexPath)
        
        let data = orders[indexPath.row]
        cell.initData(with: data)
    
        return cell
        
    }
    

    
}


extension OrdersVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
}
             
