//
//  SignUpVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 04/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var IdInput: UITextField!
    @IBOutlet weak var NameInput: UITextField!
    @IBOutlet weak var PassWordInput: UITextField!
    
    @IBAction func SignUp(_ sender: Any) {
        
        if (IdInput.text != "" &&
            NameInput.text != "" &&
            PassWordInput.text != ""){
            
        let registerMutation = RegisterMutation(email: IdInput.text, username: NameInput.text, password: PassWordInput.text)
            
            apollo.perform(mutation: registerMutation){ result,error in
                
                if (result?.data?.register?.isSuccess ?? false){
                    let alert = UIAlertController(title: "회원 가입이 완료되었습니다.", message: "", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default) {
                        (OkBtn) in self.navigationController?.popViewController(animated: true)
                        
                        self.present(alert, animated: true, completion: nil)
                        
                    })
                } else {
                    print("실패 ㅜㅠ")
                }
            }
            
            
        } else {
            let alert = UIAlertController(title: "내용을 모두 입력해주세요.", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = Color.PURPLE.getColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}
