//
//  Todos.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 05/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

class TodosVC: UIViewController, IndicatorInfoProvider{
    @IBOutlet weak var TodoTableView: UITableView!
    
    override func viewDidLoad() {
        TodoTableView.delegate = self
        TodoTableView.dataSource = self
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Todos")
    }
}

extension TodosVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let infinitycell = TodoTableView.dequeueReusableCell(withIdentifier: "InfinityCell", for: indexPath as IndexPath) as! TodoInfinityCell
        
        let standardcell = TodoTableView.dequeueReusableCell(withIdentifier: "StandardCell", for: indexPath as IndexPath) as! TodoStandardCell
        
        infinitycell.todo_work.text = "do work"
        standardcell.todo_standard_cell.text = "do work"
        standardcell.todo_standard_status.text = "3 DAYS LEFT, 80% COMPLETED"
        
        infinitycell.selectionStyle = .none
        standardcell.selectionStyle = .none
        
        return standardcell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
