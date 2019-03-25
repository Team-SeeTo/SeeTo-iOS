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
        apollo.perform(mutation: NewIdeaMutation(category: category, token: UserDefaults.standard.value(forKey: "accessToken") as? String, body: Ideas_content.text, title: Ideas_title.text)) { result,error in
            
            if(result?.data?.newIdea?.result?.asResponseMessageField?.isSuccess! ?? false){
                let alert = UIAlertController(title: "아이디어 작성", message: "새 아이디어 작성이 완료되었습니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                    self.navigationController?.popToRootViewController(animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)
            } else {
                self.showToast(msg: "새 아이디어 작성에 실패하였습니다.")
            }
        }
    }
}

