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
import RxApolloClient

class LoginVC: UIViewController {
    @IBOutlet weak var IdInput: UITextField!
    @IBOutlet weak var PassWordInput: UITextField!
    let userdefault = UserDefaults.standard
    
    
    @IBAction func LoginBtn(_ sender: Any) {
        if(!IdInput.text!.isEmpty && !PassWordInput.text!.isEmpty){
            _ = apollo.rx.perform(mutation: AuthMutation(password: PassWordInput.text, email: IdInput.text))
                .subscribe(onNext : { [weak self] res in
                    if (res == nil) {self?.showToast(msg: "아이디와 비밀번호를 다시 확인해주세요.")}
                    else {
                        self?.dismiss(animated: true, completion: nil)
                        self?.navigationController?.popViewController(animated: false)
                        self?.performSegue(withIdentifier: "toMain", sender: nil)
                        self?.userdefault.set(res.auth?.result?.asAuthField?.accessToken, forKey: "accessToken")
                        self?.userdefault.set(res.auth?.result?.asAuthField?.refreshToken, forKey: "refreshToken")
                        print("ㄱㄷㅈㅂ\(res.auth?.result?.asAuthField?.accessToken ?? "")")
                    }
                })
        } else {
            self.showToast(msg: "내용을 모두 입력해주세요")
        }
    }
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}

