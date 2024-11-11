//
//  AdressesVC.swift
//  test
//
//  Created by Mohammed Saleh on 11/11/2024.
//

import UIKit

class AdressesVC: UIViewController {
    
    @IBOutlet weak var addressesTV: UITableView!

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
        tv.configureTableView(delegate: self, dataSource: self, cellType: AdressesCell.self, cellIdentifier: "AdressesCell")
    }
    
}

extension AdressesVC : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: AdressesCell.self, for: indexPath)
        
        return  cell
    }
    
    
}


extension AdressesVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }
}
