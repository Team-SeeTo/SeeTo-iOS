//
//  IdeasWriteContentVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 10/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import UITextView_Placeholder

class IdeasWriteContentVC : UIViewController {
   
    @IBOutlet weak var Ideas_title: UITextField!
    @IBOutlet weak var Ideas_content: UITextView!
    var category = ""
    
    override func viewDidLoad() {
//        Ideas_content.placeholder = "contents here"
//        Ideas_content.placeholderColor = UIColor.gray
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "finish", style: .plain, target: self, action: #selector(IdeasWriteContentVC.goNext))
    }
}

extension IdeasWriteContentVC {
    @objc func goNext(){
        apollo.rx.perform(mutation: NewIdeaMutation(category: category, token: UserDefaults.standard.value(forKey: "accessToken") as? String, body: Ideas_content.text, title: Ideas_title.text))
        .subscribe(onNext: { [weak self] res in
            guard let this = self else { return }
            
            if(res.newIdea == nil ){this.showToast(msg: "아이디어 작성 실패")}
            else {
                let alert = UIAlertController(title: "아이디어 작성", message: "새 아이디어 작성이 완료되었습니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                    let ideaVC = IdeasVC()
                    ideaVC.getIdeasList()
                    
                    this.navigationController?.popToRootViewController(animated: true)
                }))
                
                this.present(alert, animated: true, completion: nil)
            }
            
        })
    }
}

