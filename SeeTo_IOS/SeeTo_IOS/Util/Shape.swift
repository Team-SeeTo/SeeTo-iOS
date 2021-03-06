//
//  Shape.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 04/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class LoginButtonShape : UIButton {
    
    override func awakeFromNib() {
        setShape()
    }
    
    func setShape(){
        layer.cornerRadius = frame.height / 2
        layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize.init(width: 1, height: 1)
        backgroundColor = Color.MINT.getColor()
        tintColor = UIColor.white
    }
    
}

class NavigationShape : UINavigationController {
    override func awakeFromNib() {
        setShape()
    }
    
    func setShape(){
        navigationBar.tintColor = Color.PURPLE.getColor()
    }
}

class FabShape: UIButton {
    override func awakeFromNib() {
        setShape()
    }
    func setShape(){
        layer.cornerRadius = frame.height / 2
    }
}

class TextViewShpae : UITextView{
    override func awakeFromNib() {
        setShape()
    }
    
    func setShape(){
        
    }
}

class dynamicTableView: UITableView {
    var height: CGFloat = 0
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: contentSize.width, height: height)
    }
}
