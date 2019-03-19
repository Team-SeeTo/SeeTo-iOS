//
//  QuickMemoWriteVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 19/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import UITextView_Placeholder

class QuickMemoWirteVC : UIViewController {
    
    @IBOutlet weak var QuickMemoWriteTextView: UITextView!
    
    override func viewDidLoad() {
        QuickMemoWriteTextView.placeholder = "ContentHere"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "finish", style: .plain, target: self, action: #selector(QuickMemoWirteVC.goFinish))
    }
    
}

extension QuickMemoWirteVC{
    @objc func goFinish(){
    
    }
}
