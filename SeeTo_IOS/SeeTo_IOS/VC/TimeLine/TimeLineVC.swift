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
        self.tableview.reloadData()
    }
    
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
        tableview.isScrollEnabled = false
        self.tableview.reloadData()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "TimeLine")
    }
}

extension TimeLineVC : UITableViewDelegate, UITableViewDataSource{
    func getTimeLineData(date : String){
        _ = apollo.rx.fetch(query: TimelineMainQuery(token: UserDefaults.standard.value(forKey: "accessToken") as? String , date: date))
            .subscribe(onNext: { [weak self] res in
                if(res.timeline == nil) {self!.showToast(msg: "Timeline 불러오기 실패")}
                else {
                    print("faster networking")
                    print("fdsa \(String(describing: res.timeline?.asTimeLineField?.ideas?.newCreate))")
                    
                    self!.firstNum_array.append(res.timeline?.asTimeLineField?.todo?.milestoneComplete ?? 0)
                    self!.firstNum_array.append(res.timeline?.asTimeLineField?.ideas?.newVote ?? 0)
                    
                    self!.secondNum_array.append(res.timeline?.asTimeLineField?.todo?.todoComplete ?? 0)
                    self!.secondNum_array.append(res.timeline?.asTimeLineField?.ideas?.newComment ?? 0)
                    
                    self!.thirdNum_array.append(res.timeline?.asTimeLineField?.todo?.newCreate ?? 0)
                    self!.thirdNum_array.append(res.timeline?.asTimeLineField?.ideas?.newCreate ?? 0)
                    
                    self!.totalNum_array.append(res.timeline?.asTimeLineField?.ideas?.totalPoint ?? 0)
                    self!.totalNum_array.append(res.timeline?.asTimeLineField?.todo?.totalPoint ?? 0)
                    
                    self?.totalNum_array.forEach { print("totalnum \($0)") }
                    
                    self!.tableview.reloadData()
                }
            })
        self.tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("faster tableview")
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "TLCell", for: indexPath as IndexPath) as! TimeLineCell
        
        cell.Title.text = title_array[indexPath.row]
        cell.FirstString.text = firstStr_array[indexPath.row]
        cell.SecondString.text = secondStr_array[indexPath.row]
        cell.ThirdString.text = thirdStr_array[indexPath.row]
        
        cell.FirstNumber.text = "\(firstNum_array[indexPath.row])"
        cell.SecondNumber.text = "\(secondNum_array[indexPath.row])"
        cell.ThirdNumber.text = "\(thirdNum_array[indexPath.row])"
        cell.TotalPoint.text = "\(totalNum_array[indexPath.row])"
        
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
