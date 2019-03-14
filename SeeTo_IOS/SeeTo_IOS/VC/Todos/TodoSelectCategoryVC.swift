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
        
    }
    
    @objc func goNext(){
        let selectMode = self.storyboard?.instantiateViewController(withIdentifier: "TodoSelectMode")
        
        self.navigationController?.pushViewController(selectMode!, animated: true)
    }
    
}
