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
    
    var todolist : [String] = []
    var category = ""
    var mode = ""
    var date = ""
   
    @IBAction func TodoAddBtn(_ sender: Any) {
        let alert = UIAlertController(title: "New Todo", message: "Add your New Todo. ", preferredStyle: .alert)
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "content here"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            let textfield = alert.textFields![0]
            if let newTodo = textfield.text, newTodo != "" {
                self.todolist.append(newTodo)
                let indexPath = IndexPath(row: self.todolist.count - 1, section: 0)
                
                self.TodoTableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        TodoTableView.delegate = self
        TodoTableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(goFinish))
    }
}

extension TodoEditVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TodoTableView.dequeueReusableCell(withIdentifier: "TodoListCell",
                                                     for: indexPath as IndexPath) as! TodoEditCell
        
        cell.TodoLabel.text = todolist[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todolist.remove(at: indexPath.row)
            self.TodoTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    @objc func goFinish(){
        
    }
    
    func NewTodoRequest(){
        
    }
}
