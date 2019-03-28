//
//  IdeasDetailVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 10/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class IdeasDetailVC : UIViewController {
    @IBOutlet weak var Title_Label: UILabel!
    @IBOutlet weak var Content_tv: UITextView!
    @IBOutlet weak var Date_Label: UILabel!
    @IBOutlet weak var like_btn: UIButton!
    
    var id = ""
    
    override func viewDidLoad() {
        getIdeasDetail()
    }
}

extension IdeasDetailVC {
    func getIdeasDetail(){
        _ = apollo.rx.fetch(query: IdeasMainQuery(token: UserDefaults.standard.value(forKey: "accessToken") as? String, view: id)).subscribe(onNext: { [weak self] res in
            guard let this = self else { return }
            if(res.ideas == nil) {this.showToast(msg: "아이디어 내용 불러오기 실패")}
            for i in (res.ideas?.indices)!{
                this.Title_Label.text = res.ideas?[i]?.asIdeasField?.title
                this.Content_tv.text = res.ideas?[i]?.asIdeasField?.body
                
                let createdat = res.ideas?[i]?.asIdeasField?.createdAt?.components(separatedBy: "T")
                this.Date_Label.text = createdat![0]
            }
        })
    }
}
