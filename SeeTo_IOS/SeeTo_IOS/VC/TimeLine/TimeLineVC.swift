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
    
    let date = Date()
    let dateFormatter = DateFormatter()
    var dateString = ""
    
    var firstNum_array : [Int] = [0,0]
    var secondNum_array : [Int] = [0,0]
    var thirdNum_array : [Int] = [0,0]
    var totalNum_array : [Int] = [0,0]
 
    
    override func viewWillAppear(_ animated: Bool) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateString = dateFormatter.string(from: date)
        getTimeLineData(date: dateString)
    }
    
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
    func getTimeLineData(date : String){
        _ = apollo.rx.fetch(query: TimelineMainQuery(token: UserDefaults.standard.value(forKey: "accessToken") as? String , date: date))
            .subscribe(onNext: { [weak self] res in
                guard let this = self else { return }
                if(res.timeline == nil) {this.showToast(msg: "Timeline 불러오기 실패")}
                else {
                    this.firstNum_array.insert(res.timeline?.asTimeLineField?.todo?.milestoneComplete ?? 0,at: 0)
                    this.firstNum_array.insert(res.timeline?.asTimeLineField?.ideas?.newVote ?? 0,at: 1)
                    
                    this.secondNum_array.insert(res.timeline?.asTimeLineField?.todo?.todoComplete ?? 0,at: 0)
                    this.secondNum_array.insert(res.timeline?.asTimeLineField?.ideas?.newComment ?? 0,at: 1)
                    
                    this.thirdNum_array.insert(res.timeline?.asTimeLineField?.todo?.newCreate ?? 0,at: 0)
                    this.thirdNum_array.insert(res.timeline?.asTimeLineField?.ideas?.newCreate ?? 0,at: 1)
                    
                    this.totalNum_array.insert(res.timeline?.asTimeLineField?.todo?.totalPoint ?? 0,at: 0)
                    this.totalNum_array.insert(res.timeline?.asTimeLineField?.ideas?.totalPoint ?? 0,at: 1)
                    
                    this.tableview.reloadData()
                }
            })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableview.dequeueReusableCell(withIdentifier: "TLCell", for: indexPath as IndexPath) as! TimeLineCell
        
        cell.Title.text = title_array[indexPath.section]
        cell.FirstString.text = firstStr_array[indexPath.section]
        cell.SecondString.text = secondStr_array[indexPath.section]
        cell.ThirdString.text = thirdStr_array[indexPath.section]
        
        cell.FirstNumber.text = "\(firstNum_array[indexPath.section])"
        cell.SecondNumber.text = "\(secondNum_array[indexPath.section])"
        cell.ThirdNumber.text = "\(thirdNum_array[indexPath.section])"
        cell.TotalPoint.text = "\(totalNum_array[indexPath.section])"
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return title_array.count
    }
}

class TimeLineCell : UITableViewCell {
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var FirstNumber: UILabel!
    @IBOutlet weak var FirstString: UILabel!
    @IBOutlet weak var SecondNumber: UILabel!
    @IBOutlet weak var SecondString: UILabel!
    @IBOutlet weak var ThirdNumber: UILabel!
    @IBOutlet weak var ThirdString: UILabel!
    @IBOutlet weak var TotalPoint: UILabel!
}
