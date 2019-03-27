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
    var quickMemo_array : [String] = []
    var current_content = ""
    
    @IBOutlet weak var tableview: dynamicTableView!
    
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for i in coreData.get().indices {
            if coreData.get()[i].value(forKey: "content") as? String != nil{
                quickMemo_array.append(coreData.get()[i].value(forKey: "content") as! String)
                self.tableview.height = CGFloat((200*(self.quickMemo_array.count )))
            }
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo { return IndicatorInfo(title: "QuickMemo") }
}

extension QuickMemoVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "QMCell", for: indexPath as IndexPath) as! QuickMemoCell
        
        cell.PreviewText.text = quickMemo_array[indexPath.section]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return quickMemo_array.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.tableview.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        current_content = quickMemo_array[indexPath.row]
        self.performSegue(withIdentifier: "toQMDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQMDetail" {
            let QMDetail = segue.destination as! QuickMemoDetailVC
            QMDetail.QM_content = current_content
        }
    }
    
}

class QuickMemoCell : UITableViewCell {
    @IBOutlet weak var PreviewText: UILabel!
}
