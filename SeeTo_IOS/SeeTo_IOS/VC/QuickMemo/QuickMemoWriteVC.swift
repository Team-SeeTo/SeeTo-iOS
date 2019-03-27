//
//  QuickMemoWriteVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 19/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class QuickMemoWirteVC : UIViewController {
    
    @IBOutlet weak var QuickMemoWriteTextView: UITextView!
    var coreData : CoreData!
    
    override func viewDidLoad() {
        QuickMemoWriteTextView.placeholder = "ContentHere"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "finish", style: .plain, target: self, action: #selector(QuickMemoWirteVC.goFinish))
    }
    
}

extension QuickMemoWirteVC{
    @objc func goFinish(){
        print("finish button clicked")
        coreData = CoreData.init(entityName: "Memo")
        coreData.set(value: QuickMemoWriteTextView.text , Key: "content")
        let result = coreData.get()
        if result == nil { self.showToast(msg: "메모 저장 실패") }
        else {
            let alert = UIAlertController(title: "Memo", message: "메모가 성공적으로 등록되었습니다.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
