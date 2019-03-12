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
    
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = Color.PURPLE.getColor()
    }
}

