//
//  MainMenuVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 07/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class MainMenuVC : UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var point: UILabel!
    
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        apollo.fetch(query: SimpleProfileQuery(token: UserDefaults.standard.value(forKey: "accessToken") as? String)){ result,error in
            
            if(!(result?.data?.profile?.asProfileField?.email?.isEmpty ?? true)){
                self.userName.text = "\(result?.data?.profile?.asProfileField?.username ?? "")"
                self.rank.text = "My rank : #\(result?.data?.profile?.asProfileField?.rank ?? 0)"
               self.point.text = "\(result?.data?.profile?.asProfileField?.point ?? 0)p"
            } else {
                self.showToast(msg: "계정 정보 불러오기 실패")
            }
            
        }
    }
}

extension MainMenuVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuCell", for: indexPath as IndexPath) as! MainMenuCell
        
        cell.menuLabel.text = "store"
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
