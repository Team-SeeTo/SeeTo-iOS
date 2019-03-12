//
//  TimeLineVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 05/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

class TimeLineVC : UIViewController , IndicatorInfoProvider {
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "TimeLine")
    }
}

extension TimeLineVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "TLCell", for: indexPath as IndexPath) as! TimeLineCell
        
        cell.FirstNumber.text = "13"
        cell.SecondNumber.text = "7"
        cell.ThirdNumber.text = "2"
        cell.TotalPoint.text = "230p"
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}
