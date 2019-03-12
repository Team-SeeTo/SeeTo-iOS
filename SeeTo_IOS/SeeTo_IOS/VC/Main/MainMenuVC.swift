//
//  MainMenuVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 07/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class MainMenuVC : UIViewController {
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
    }
}

extension MainMenuVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuCell", for: indexPath as IndexPath) as! MainMenuCell
        
        cell.menuLabel.text = "store"
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
