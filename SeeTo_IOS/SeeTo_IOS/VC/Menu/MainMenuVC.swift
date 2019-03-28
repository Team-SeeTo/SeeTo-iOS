//
//  MainMenuVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 07/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import RxApolloClient

class MainMenuVC : UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var point: UILabel!
    
    let images = [(UIImage(named: "store.png")),(UIImage(named: "leaderboard.png")),
                 (UIImage(named: "mirror.png")),(UIImage(named: "settings.png"))]
    
    let titles = ["Store", "LeaderBoard","Mirror","Settings"]
    
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.isScrollEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _ =  apollo.rx.fetch(query: SimpleProfileQuery(token: UserDefaults.standard.value(forKey: "accessToken") as? String)).subscribe(onNext: {[weak self] res in
            guard let this = self else { return }
            if (res == nil) {this.showToast(msg: "계정 정보 불러오기 실패")}
            else {
                this.userName.text = res.profile?.asProfileField?.username ?? ""
                this.rank.text = "My rank : #\(res.profile?.asProfileField?.rank ?? 0)"
                this.point.text = "\(res.profile?.asProfileField?.point ?? 0)p"
            }
        })
    }
}

extension MainMenuVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuCell", for: indexPath as IndexPath) as! MainMenuCell
        
        cell.menuImage.image = images[indexPath.row]
        cell.menuLabel.text = titles[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row){
        case 0 :
            let store = self.storyboard?.instantiateViewController(withIdentifier: "StoreTabVC")
            self.navigationController?.pushViewController(store!, animated: true)
            break
        default:
            break
        }
    }
    
}

class MainMenuCell : UITableViewCell {
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
}
