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
    
    var todoTitie_array : [String] = []
    var todoCategory_array : [String] = []
    var milestonesName_array : [String] = []
    var milestonesID_array : [String] = []
    var milestonesIsChecked_array : [Bool] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
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
                if(res.todo == nil) {self?.showToast(msg: "todo 정보 불러오기 실패")}
                else {
                    for i in (res.todo?.indices)!{
                        self?.todoTitie_array.append(res.todo?[i]?.asToDoField?.title ?? "nil")
                        self?.todoCategory_array.append(res.todo?[i]?.asToDoField?.type ?? "nil")
                        
                        for j in (res.todo?[i]?.asToDoField?.milestones?.indices)!{
                            self?.milestonesName_array.append(res.todo?[i]?.asToDoField?.milestones?[j]?.name ?? "nil")
                            self?.milestonesID_array.append(res.todo?[i]?.asToDoField?.milestones?[j]?.id ?? "nil")
                            self?.milestonesIsChecked_array.append(res.todo?[i]?.asToDoField?.milestones?[j]?.isCompleted ?? false)
                        }
                    }
                    
                    self?.TodoTableView.reloadData()
                }
            })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoTitie_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let standardcell = TodoTableView.dequeueReusableCell(withIdentifier: "StandardCell", for: indexPath as IndexPath) as! TodoStandardCell
        
        standardcell.todo_standard_cell.text = todoTitie_array[indexPath.row]
        standardcell.todo_standard_status.text = todoCategory_array[indexPath.row]
        
        standardcell.selectionStyle = .none
        
        return standardcell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
