//
//  IdeasVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 05/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip
import RxApolloClient
import RxSwift
import RxCocoa

class IdeasVC : UIViewController, IndicatorInfoProvider {
    @IBOutlet weak var tableview: UITableView!
    var title_array = [""]
    var category_array = [""]
    var commentCount_array = [0]
    var likeCount_array = [0]
    
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
        getIdeasList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Ideas")
    }
}

extension IdeasVC : UITableViewDataSource, UITableViewDelegate{
    
    func getIdeasList(){
        _ = apollo.rx.fetch(query: IdeasMainQuery(token:
            UserDefaults.standard.value(forKey: "accessToken") as? String, page: 0))
            .subscribe(onNext: { [weak self] res in
                if(res.ideas == nil) {self!.showToast(msg: "Ideas 불러오기 실패")}
                else {
                    for i in (res.ideas?.indices)! {
                        self?.title_array[i] = res.ideas?[i]?.asIdeasField?.title ?? "nil"
                        self?.category_array[i] = res.ideas?[i]?.asIdeasField?.category ?? "nil"
                        self?.commentCount_array[i] = res.ideas?[i]?.asIdeasField?.comments?.commentCount ?? 0
                        self?.likeCount_array[i] = res.ideas?[i]?.asIdeasField?.upvoter ?? 0
                    }
                }
            })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdeasCell", for: indexPath as IndexPath) as! IdeasCell
        
        cell.Title.text = title_array[indexPath.row]
        cell.Category.text = category_array[indexPath.row]
        cell.like_total.text = "\(likeCount_array[indexPath.row])"
        cell.comment_total.text = "\(commentCount_array[indexPath.row])"
        
        cell.selectionStyle = .none

        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let IdeasDetail = self.storyboard?.instantiateViewController(withIdentifier: "IdeasDetail")
        
        self.navigationController?.pushViewController(IdeasDetail!, animated: true)
    }
    
    
}
