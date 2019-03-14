//
//  LoginVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 28/02/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LoginVC: UIViewController {
    @IBOutlet weak var IdInput: UITextField!
    @IBOutlet weak var PassWordInput: UITextField!
    
    @IBAction func LoginBtn(_ sender: Any) {
        if(!IdInput.text!.isEmpty && !PassWordInput.text!.isEmpty){
            apollo.perform(mutation:
                AuthMutation(password: PassWordInput.text, email: IdInput.text))
            {result,error in
                if (result?.data?.auth?.result?.asAuthField?.accessToken) != nil {
//                    self.performSegue(withIdentifier: "toMain", sender: nil)
                    
                    UserDefaults.standard.set(result?.data?.auth?.result?.asAuthField?.accessToken, forKey: "accessToken")
                    
                    UserDefaults.standard.set(result?.data?.auth?.result?.asAuthField?.refreshToken, forKey: "refreshToken")
                    
                }
                
                if error != nil {
                    print("error!")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}
