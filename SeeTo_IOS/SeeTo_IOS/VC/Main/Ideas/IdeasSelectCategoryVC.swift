//
//  IdeasSelectCategory.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 10/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class IdeasSelectCategoryVC : UIViewController {
    @IBOutlet weak var PickerView: UIPickerView!
    
    let Categorys = ["IT","Life","Food"]
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(IdeasSelectCategoryVC.goNext))
        PickerView.dataSource = self
        PickerView.delegate = self
    }
}

extension IdeasSelectCategoryVC : UIPickerViewDelegate,
UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Categorys.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Categorys[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    @objc func goNext(){
        let WriteContent = self.storyboard?.instantiateViewController(withIdentifier: "IdeasWriteContent")
        
        self.navigationController?.pushViewController(WriteContent!, animated: true)
    }
    
}
