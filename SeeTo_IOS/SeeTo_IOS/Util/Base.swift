//
//  Base.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 10/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{

func showToast(msg: String, fun: (() -> Void)? = nil){
    let toast = UILabel(frame: CGRect(x: 32, y: 700, width: view.frame.size.width - 64, height: 42))
    toast.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    toast.textColor = UIColor.white
    toast.text = msg
    toast.textAlignment = .center
    toast.layer.cornerRadius = 8
    toast.clipsToBounds = true
    toast.autoresizingMask = [.flexibleTopMargin, .flexibleHeight, .flexibleWidth]
    view.addSubview(toast)
    UIView.animate(withDuration: 1, delay: 0.8, options: .curveEaseOut, animations: {
        toast.alpha = 0.0
    }, completion: { _ in
        toast.removeFromSuperview()
        fun?()
    })
}

}
