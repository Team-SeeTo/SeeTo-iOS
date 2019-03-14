//
//  ViewController.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 28/02/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import CoreData

class MainVC : ButtonBarPagerTabStripViewController{
    @IBOutlet weak var MainFabtn: FabShape!
    @IBOutlet weak var TodoFab: FabShape!
    @IBOutlet weak var IdeasFab: FabShape!
    @IBOutlet weak var MemoFab: FabShape!
    
    var flag = false
    
    @IBAction func TodoFab_Click(_ sender: Any) {
    }
    @IBAction func IdeasFab_Click(_ sender: Any) {
    }
    @IBAction func MemoFab_Click(_ sender: Any) {
    }
    
    @IBAction func MainFAB(_ sender: Any) {
       MainFaBtnClick()
    }

    @IBAction func MenuBtn(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: nil)
    }
    
    @IBOutlet weak var SearchBtn: UIBarButtonItem!
    
    @IBAction func SortBtn(_ sender: Any) {
        
      

        let alert = UIAlertController(title: "Order By", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Ascending", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Descending", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Left time", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Type", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        
        apollo.fetch(query: SimpleProfileQuery(token: UserDefaults.standard.value(forKey: "accessToken") as? String)){ result,error in
        
            if(!(result?.data?.profile?.asProfileField?.email?.isEmpty ?? true)){
                    UserDefaults.standard.set(result?.data?.profile?.asProfileField?.email ?? "", forKey: "email")
                    UserDefaults.standard.set(result?.data?.profile?.asProfileField?.username ?? "", forKey: "username")
                    UserDefaults.standard.set(result?.data?.profile?.asProfileField?.rank ?? "", forKey: "rank")
                    UserDefaults.standard.set(result?.data?.profile?.asProfileField?.point ?? "", forKey: "point" )
            } else {
                self.showToast(msg: "계정 정보 불러오기 실패")
            }
            
        }
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        settings.style.buttonBarItemTitleColor = Color.PURPLE.getColor()
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = Color.PURPLE.getColor()
        buttonBarView.selectedBar.backgroundColor = settings.style.selectedBarBackgroundColor
        
        print("ㅁㄴㅇㄹ\(String(describing: UserDefaults.standard.value(forKey: "accessToken") as! String))")
        print("ㅁㄴㅇㄹ\(String(describing: UserDefaults.standard.value(forKey: "refreshToken") as! String))")

        
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
    
extension MainVC {
    func MainFaBtnClick(){
        if(flag == false){
            flag = true
            UIView.animate(withDuration: 0.3, animations: {
                self.MainFabtn.transform = CGAffineTransform(rotationAngle: 0.8)
                self.MainFabtn.backgroundColor = Color.MAINPURPLE.getColor()
            })
            
            UIView.animate(withDuration: 0.3, animations: {
                self.MemoFab.transform = CGAffineTransform(scaleX: 3, y: 3)
                self.MemoFab.backgroundColor = Color.MEMOPURPLE.getColor()
            })
            
            UIView.animate(withDuration: 0.3, animations: {
                self.IdeasFab.transform = CGAffineTransform(scaleX: 5.5, y: 5.5)
                self.IdeasFab.backgroundColor = Color.IDEASPURPLE.getColor()
            })
            
            UIView.animate(withDuration: 0.3, animations: {
                self.TodoFab.transform = CGAffineTransform(scaleX: 8, y: 8)
                self.TodoFab.backgroundColor = Color.TODOPURPLE.getColor()
            })
        } else {
            flag = false
            
            UIView.animate(withDuration: 0.3, animations: {
                self.MainFabtn.transform = CGAffineTransform(rotationAngle: 1.6)
                self.MainFabtn.backgroundColor = Color.LIGHTPURPLE.getColor()
            })
            
            UIView.animate(withDuration: 0.3, animations: {
                self.MemoFab.transform = CGAffineTransform(scaleX: 3/3, y: 3/3)
                self.MemoFab.backgroundColor = Color.MEMOPURPLE.getColor()
            })
            
            UIView.animate(withDuration: 0.3, animations: {
                self.IdeasFab.transform = CGAffineTransform(scaleX: 5.5/5.5, y: 5.5/5.5)
                self.IdeasFab.backgroundColor = Color.IDEASPURPLE.getColor()
            })
            
            UIView.animate(withDuration: 0.3, animations: {
                self.TodoFab.transform = CGAffineTransform(scaleX: 8/8, y: 8/8)
                self.TodoFab.backgroundColor = Color.TODOPURPLE.getColor()
            })
        }
    }
}



