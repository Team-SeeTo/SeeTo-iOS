//
//  TodoSelectMode.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 10/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class TodoSelectModeVC : UIViewController {
    @IBOutlet weak var pickerview: UIPickerView!
    
    let modes = ["Standard","Hard","Infinity"]
    
    override func viewDidLoad() {
        pickerview.dataSource = self
        pickerview.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(TodoSelectModeVC.goNext))
        
    }
    
}

extension TodoSelectModeVC : UIPickerViewDataSource,
UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return modes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    }
    
    @objc func goNext(){
        let SelectDate = self.storyboard?.instantiateViewController(withIdentifier: "TodoSelectDate")
        
        self.navigationController?.pushViewController(SelectDate!, animated: true)
    }
    
    
}

