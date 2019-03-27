//
//  QuickMemoVC.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 05/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import XLPagerTabStrip

class QuickMemoVC : UIViewController , IndicatorInfoProvider{
    let coreData = CoreData.init(entityName: "Memo")
    var quickMemo_array : [NSManagedObject]!
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
        quickMemo_array = coreData.get()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo { return IndicatorInfo(title: "QuickMemo") }
}

extension QuickMemoVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quickMemo_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "QMCell", for: indexPath as IndexPath) as! QuickMemoCell
        
        cell.PreviewText.text = quickMemo_array[indexPath.row].value(forKey: "content") as? String
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let QuickMemoDetail = self.storyboard?.instantiateViewController(withIdentifier: "QuickMemoDetail")
        
        self.navigationController?.pushViewController(QuickMemoDetail!, animated: true)
    }
    
}

class QuickMemoCell : UITableViewCell {
    @IBOutlet weak var PreviewText: UILabel!
}
