//
//  TodoDetailVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 25/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class TodoDetailVC : UIViewController {
    @IBOutlet weak var TodoDetailTitle: UILabel!
    @IBOutlet weak var TodoDetail_tableview: UITableView!
    
    override func viewDidLoad() {
        TodoDetail_tableview.delegate = self
        TodoDetail_tableview.dataSource = self
    }
}

extension TodoDetailVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TodoDetail_tableview.dequeueReusableCell(withIdentifier: "TodoDetailCell", for: indexPath as IndexPath) as! TodoDetailCell
        
        cell.textLabel?.text = "asdf"
        
        return cell
    }
}


