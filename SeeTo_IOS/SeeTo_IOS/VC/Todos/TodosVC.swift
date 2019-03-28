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
    @IBOutlet weak var TodoTableView: dynamicTableView!
    
    var todoTitie_array : [String] = []
    var todoCategory_array : [String] = []
    var todoID_array : [String] = []
    var current_row = ""
    
    
    override func viewWillAppear(_ animated: Bool) {
//        getTodoListData()
    }
    
    override func viewDidLoad() {
        TodoTableView.delegate = self
        TodoTableView.dataSource = self
        getTodoListData()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Todos")
    }
}

extension TodosVC : UITableViewDelegate, UITableViewDataSource {
    
    func getTodoListData () {
        _ = apollo.rx.fetch(query: TodoMainQuery(token: UserDefaults.standard.value(forKey: "accessToken") as? String, orderBy: "created_at"))
            .subscribe(onNext: { [weak self] res in
                guard let this = self else { return }
                if(res.todo == nil) {this.showToast(msg: "todo 정보 불러오기 실패")}
                else {
                    for i in (res.todo?.indices)!{
                        this.todoTitie_array.insert(res.todo?[i]?.asToDoField?.title ?? "nil", at: i)
                        this.todoCategory_array.insert(res.todo?[i]?.asToDoField?.type ?? "nil", at: i)
                        this.todoID_array.insert(res.todo?[i]?.asToDoField?.id ?? "nil" , at: i)
                        this.TodoTableView.height = CGFloat((110*(self?.todoTitie_array.count ?? 1)))
                    }
                    this.TodoTableView.reloadData()
                }
            })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let standardcell = TodoTableView.dequeueReusableCell(withIdentifier: "StandardCell", for: indexPath as IndexPath) as! TodoStandardCell
        
        standardcell.todo_standard_cell.text = todoTitie_array[indexPath.section]
        standardcell.todo_standard_status.text = todoCategory_array[indexPath.section]
        
        standardcell.selectionStyle = .none
        
        return standardcell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return todoTitie_array.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        current_row = todoTitie_array[indexPath.section]
        performSegue(withIdentifier: "toTodoDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTodoDetail" {
            let TodoDetail = segue.destination as! TodoDetailVC
            TodoDetail.todo_title = current_row
        }
    }
    
}

class TodoStandardCell : UITableViewCell {
    @IBOutlet weak var todo_standard_cell: UILabel!
    
    @IBOutlet weak var todo_standard_status: UILabel!
}

