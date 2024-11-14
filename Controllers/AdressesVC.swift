//
//  AdressesVC.swift
//  test
//
//  Created by Mohammed Saleh on 11/11/2024.
//

import UIKit

class AdressesVC: UIViewController {
    
    
    @IBOutlet weak var addressesTV: UITableView!
    
    var adressList:[Adress] = [
        Adress(title: "My Home", details: "Kuwait, Hawally , Bayan", isSelected: true),
        Adress(title: "My Work", details: "Kuwait, Hawally , Bayan", isSelected: false),
        Adress(title: "Uncle Address", details: "Kuwait, Hawally , Bayan", isSelected: false),
        Adress(title: "Office Address ", details: "Kuwait, Hawally , Bayan", isSelected: false)

    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

}
    
    
}

extension AdressesVC{
    
     func setupUI(){
         initTV(tv: addressesTV)
    }
    
    func initTV(tv: UITableView) {
        tv.configureTableView(delegate: self, dataSource: self, cellType: AdressesCell.self, cellIdentifier: "AdressesCell", typeSeparator: .singleLine , separatorInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
}

extension AdressesVC : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: AdressesCell.self, for: indexPath)
        let data = adressList[indexPath.row]
        cell.setData(cellData: data)
        cell.cellIndex = indexPath.row
        cell.delagate = self
        return  cell
    }
    
    
}


extension AdressesVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
}


extension AdressesVC : AdressesCellProtocol {

    func isDefaultClickedBut(index: Int) {
        print(index)
        for (i , item) in adressList.enumerated() {
            adressList[i].isSelected = false
        }
        adressList[index].isSelected = true
        addressesTV.reloadData()
    }
    
}
