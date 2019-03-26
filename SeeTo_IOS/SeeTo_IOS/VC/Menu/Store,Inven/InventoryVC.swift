//
//  InventoryVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 18/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class InventoryVC : UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension InventoryVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryCell", for: indexPath as IndexPath)
        as! InventroyCell
        
        cell.title.text = "Streak Freeze"
        cell.explain.text = "You can rest today!"
        
        return cell
    }
    
}

class InventroyCell : UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var explain: UILabel!
    @IBAction func UsingItem(_ sender: Any) {
        
    }
}
