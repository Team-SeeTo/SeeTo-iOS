//
//  ViewController.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 28/02/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MainVC : ButtonBarPagerTabStripViewController{
    
    @IBOutlet weak var SearchBtn: UIBarButtonItem!
    
    @IBAction func SortBtn(_ sender: Any) {
        
    }
    
    @IBAction func MenuBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var MainFabtn: FabShape!
    
    @IBAction func MainFAB(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings.style.buttonBarItemTitleColor = Color.PURPLE.getColor()
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = Color.PURPLE.getColor()
        buttonBarView.selectedBar.backgroundColor = settings.style.selectedBarBackgroundColor
        

        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = Color.GREY.getColor()
            newCell?.label.textColor = Color.PURPLE.getColor()
        }

        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor : Color.PURPLE.getColor(),
             NSAttributedString.Key.font : UIFont(name: "Hoodson Script Free Demo", size: 25)!]
        
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let Todo = UIStoryboard(name: "Todos", bundle: nil).instantiateViewController(withIdentifier: "Main_Todo")
        
        let TimeLine = UIStoryboard(name: "TimeLine", bundle:
            nil).instantiateViewController(withIdentifier: "Main_TimeLine")
        
        let Ideas = UIStoryboard(name: "Ideas", bundle:
            nil).instantiateViewController(withIdentifier: "Main_Ideas")
        
        let QuickMemo = UIStoryboard(name: "QuickMemo", bundle:
            nil).instantiateViewController(withIdentifier: "Main_QuickMemo")
        
        return [Todo,TimeLine,Ideas,QuickMemo]
        
    }
}




