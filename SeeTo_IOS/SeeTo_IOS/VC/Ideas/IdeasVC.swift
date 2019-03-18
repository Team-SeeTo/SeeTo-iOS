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

class IdeasVC : UIViewController, IndicatorInfoProvider {
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Ideas")
    }
}

extension IdeasVC : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdeasCell", for: indexPath as IndexPath) as! IdeasCell
        
        cell.Title.text = "Title here"
        cell.Category.text = "Category here"
        cell.like_total.text = "23.1k"
        cell.comment_total.text = "411"
        cell.rank.text = "1st"
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
