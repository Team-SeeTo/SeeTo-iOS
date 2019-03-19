//
//  SignUpVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 04/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import RxApolloClient

class SignUpVC: UIViewController {
    
    @IBOutlet weak var IdInput: UITextField!
    @IBOutlet weak var NameInput: UITextField!
    @IBOutlet weak var PassWordInput: UITextField!
    
    @IBAction func SignUp(_ sender: Any) {
        
        if (IdInput.text != "" &&
            NameInput.text != "" &&
            PassWordInput.text != ""){
            
            _ = apollo.rx.perform(mutation: RegisterMutation(email: IdInput.text, username: NameInput.text, password: PassWordInput.text)).subscribe(onNext: { [weak self] res in
                if(res.register?.isSuccess == nil) {self?.showToast(msg: "서버 요청 실패")}
                if(res.register?.isSuccess == false) { self?.showToast(msg: "회원가입에 실패하였습니다.") }
                else {
                    let alert = UIAlertController(title: "회원 가입이 완료되었습니다.", message: "", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default) {
                        (OkBtn) in self?.navigationController?.popViewController(animated: true)
                    })
                    self?.present(alert, animated: true, completion: nil)
                }
            })
            
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
