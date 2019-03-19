//
//  StoreVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 15/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class StoreVC : UIViewController {
    @IBOutlet weak var StoreTableView: UITableView!
    
    let title_array = ["Streak Freeze", "ToDo Bonus", "Ideas Bonus", "Double 24"]
    let explain_array = ["You can rest today!","double today's\ntodo point",
                         "double today's\nidea point","double today's\ntotal point"]
    let price = ["3000xp", "1000xp", "1000xp", "2000xp"]
    
    override func viewDidLoad() {
        StoreTableView.delegate = self
        StoreTableView.dataSource = self
        StoreTableView.isScrollEnabled = false
    }
}

extension StoreVC : UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath as IndexPath) as! StoreCell
        
        cell.item_title.text = title_array[indexPath.row]
        cell.item_explain.text = explain_array[indexPath.row]
        cell.item_price.text = price[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

}
