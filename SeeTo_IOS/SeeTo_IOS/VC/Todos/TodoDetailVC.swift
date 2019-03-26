//
//  TodoDetailVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 25/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import DLRadioButton

class TodoDetailVC : UIViewController {
    @IBOutlet weak var TodoDetailTitle: UILabel!
    @IBOutlet weak var TodoDetail_tableview: UITableView!
    
    var todo_title = ""
    var todo_milestonesTitle_array : [String] = []
    
    override func viewDidLoad() {
        TodoDetail_tableview.delegate = self
        TodoDetail_tableview.dataSource = self
//        getTodoDetailData()
    }
    override func viewWillAppear(_ animated: Bool) {
        getTodoDetailData()
    }
}

extension TodoDetailVC : UITableViewDelegate, UITableViewDataSource{
    
    func getTodoDetailData(){
        _ = apollo.rx.fetch(query: TodoMainQuery(token: UserDefaults.standard.value(forKey: "accessToken") as? String, orderBy: "created_at", searchString: todo_title))
            .subscribe(onNext: { [weak self] res in
                if (res.todo == nil) {self?.showToast(msg: "todo detail 정보 불러오기 실패")}
                for i in (res.todo?.indices)! {
                    self?.todo_title = res.todo?[i]?.asToDoField?.title ?? "nil"
                    for j in (res.todo?[i]?.asToDoField?.milestones?.indices)!{
                        self?.todo_milestonesTitle_array.append(res.todo?[i]?.asToDoField?.milestones?[j]?.name ?? "nil")
                    }
                }
                self?.TodoDetailTitle.text = self?.todo_title
                self?.TodoDetail_tableview.reloadData()
            })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo_milestonesTitle_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TodoDetail_tableview.dequeueReusableCell(withIdentifier: "TodoDetailCell", for: indexPath as IndexPath) as! TodoDetailCell
        
        cell.todo_content.text = todo_milestonesTitle_array[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

class TodoDetailCell : UITableViewCell {
    @IBOutlet weak var todo_checkbox: DLRadioButton!
    @IBOutlet weak var todo_content: UILabel!
}

