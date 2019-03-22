//
//  TodoSelectDateVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 10/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class TodoSelectDateVC : UIViewController {
   
    @IBOutlet weak var DatePicker: UIDatePicker!
   
    let date = Date()
    let dateFormatter = DateFormatter()
    var dateString = ""
    var category = ""
    var Mode = ""
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(TodoSelectDateVC.goNext))
        
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateString = dateFormatter.string(from: date)
        
        DatePicker.addTarget(self, action: #selector(TodoSelectDateVC.DateChanged), for: .valueChanged)
    }
}

extension TodoSelectDateVC {
    @objc func goNext() {
        self.performSegue(withIdentifier: "toWriteTodo", sender: self)
    }
    
    @objc func DateChanged(){
        dateString = dateFormatter.string(from: DatePicker.date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWriteTodo" {
            let TodoEdit = segue.destination as! TodoEditVC
            TodoEdit.category = category
            TodoEdit.date = dateString
            TodoEdit.mode = Mode
        }
    }
}
