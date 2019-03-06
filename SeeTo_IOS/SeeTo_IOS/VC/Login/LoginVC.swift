//
//  LoginVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 28/02/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var IdInput: UITextField!
    @IBOutlet weak var PassWordInput: UITextField!
    
    @IBAction func LoginBtn(_ sender: Any) {
        if(IdInput.text != "" && PassWordInput.text != ""){
            self.performSegue(withIdentifier: "toMain", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
//        UIApplication.shared.statusBarView?.backgroundColor = Color.PURPLE.getColor()
    }
}



//extension UIApplication {
//    var statusBarView : UIView? {
//        return value(forKey: "statusBar") as? UIView
//    }
//}

