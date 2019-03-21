//
//  TodoEditVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 19/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class TodoEditVC : UIViewController {
    @IBOutlet weak var TodoTableView: UITableView!
    @IBOutlet weak var TodoTitle: UITextView!
    override func viewDidLoad() {
        TodoTableView.delegate = self
        TodoTableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(goFinish))
    }
}

extension TodoEditVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TodoTableView.dequeueReusableCell(withIdentifier: "TodoListCell",
                                                     for: indexPath as IndexPath) as! TodoEditCell
        
        cell.TodoLabel.text = "hello"
        cell.selectionStyle = .none
        
        return cell
    }
    
    @objc func goFinish(){
        
    }
}
