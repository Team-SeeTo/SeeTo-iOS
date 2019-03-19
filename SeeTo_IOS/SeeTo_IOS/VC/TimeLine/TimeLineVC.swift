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
    
    let title_array = ["Todo", "Ideas"]
    let firstStr_array = ["Milestones completed","Ideas voted"]
    let secondStr_array = ["Todos completed", "Ideas commented"]
    let thirdStr_array = ["Todos created", "Ideas created"]
    
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
        tableview.isScrollEnabled = false
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "TimeLine")
    }
}

extension TimeLineVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "TLCell", for: indexPath as IndexPath) as! TimeLineCell
        
        cell.Title.text = title_array[indexPath.row]
        cell.FirstString.text = firstStr_array[indexPath.row]
        cell.SecondString.text = secondStr_array[indexPath.row]
        cell.ThirdString.text = thirdStr_array[indexPath.row]
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
        return 1
    }
}
