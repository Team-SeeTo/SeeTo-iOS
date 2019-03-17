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
    
    override func viewDidLoad() {
        StoreTableView.delegate = self
        StoreTableView.dataSource = self
    }
}

extension StoreVC : UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableView {
    
    }
}
