//
//  TdoSelectCategoryVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 08/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class TodoSelectCategoryVC : UIViewController {

    @IBOutlet weak var CategoryPickerView: UIPickerView!
    
    let categorys = ["IT","Life","Food"]
    var currentItem = ""

    
    override func viewDidLoad() {
        CategoryPickerView.delegate = self
        CategoryPickerView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(TodoSelectCategoryVC.goNext))
    }
    
}

extension TodoSelectCategoryVC : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorys.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorys[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentItem = categorys[row]
    }
    
    @objc func goNext(){
       self.performSegue(withIdentifier: "toSelectMode", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSelectMode" {
            let SelectMode = segue.destination as! TodoSelectModeVC
            SelectMode.category = currentItem
        }
    }
    
}
