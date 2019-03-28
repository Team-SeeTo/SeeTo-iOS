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
    @IBOutlet weak var tableview: dynamicTableView!
    var title_array : [String] = []
    var category_array : [String] = []
    var commentCount_array : [Int] = []
    var likeCount_array : [Int] = []
    var rank_array : [Int] = []
    var id_array : [String] = []
    var currentID = ""
    
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
            UserDefaults.standard.value(forKey: "accessToken") as? String, page: 1))
            .subscribe(onNext: { [weak self] res in
                guard let this = self else { return }
                if(res.ideas == nil) {this.showToast(msg: "Ideas 불러오기 실패")}
                else {
                    for i in (res.ideas?.indices)! {
                        this.title_array.append(res.ideas?[i]?.asIdeasField?.title ?? "nil")
                        this.category_array.append( res.ideas?[i]?.asIdeasField?.category ?? "nil")
                        this.commentCount_array.append(res.ideas?[i]?.asIdeasField?.comments?.commentCount ?? 0)
                        this.likeCount_array.append(res.ideas?[i]?.asIdeasField?.upvoter ?? 0)
                        this.id_array.append(res.ideas?[i]?.asIdeasField?.id ?? "nil")
                        this.rank_array.append(i + 1)
                    }
//                    self?.tableview.height = CGFloat((100*(self?.title_array.count ?? 1)))
                    this.tableview.reloadData()
                }
            })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdeasCell", for: indexPath as IndexPath) as! IdeasCell
        
        cell.Title.text = title_array[indexPath.section]
        cell.Category.text = category_array[indexPath.section]
        cell.like_total.text = "\(likeCount_array[indexPath.section])"
        cell.comment_total.text = "\(commentCount_array[indexPath.section])"
        cell.rank.text = "#\(rank_array[indexPath.section])"
        
        cell.selectionStyle = .none

        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return title_array.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentID = id_array[indexPath.row]
        self.performSegue(withIdentifier: "toIdeasDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toIdeasDetail" {
            let IdeasDetail = segue.destination as! IdeasDetailVC
            IdeasDetail.id = currentID
        }
    }
    
}

class IdeasCell : UITableViewCell {
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Category: UILabel!
    @IBOutlet weak var like_btn: UIImageView!
    @IBOutlet weak var like_total: UILabel!
    @IBOutlet weak var comment_total: UILabel!
    @IBOutlet weak var share_btn: UIImageView!
    @IBOutlet weak var rank: UILabel!
}
