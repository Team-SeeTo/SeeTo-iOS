//
//  QuickMemoVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 05/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

class QuickMemoVC : UIViewController , IndicatorInfoProvider{
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo { return IndicatorInfo(title: "QuickMemo") }
}

extension QuickMemoVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "QMCell", for: indexPath as IndexPath) as! QuickMemoCell
        
        cell.PreviewText.text = "hi hello"
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let QuickMemoDetail = self.storyboard?.instantiateViewController(withIdentifier: "QuickMemoDetail")
        
        self.navigationController?.pushViewController(QuickMemoDetail!, animated: true)
    }
    
}
