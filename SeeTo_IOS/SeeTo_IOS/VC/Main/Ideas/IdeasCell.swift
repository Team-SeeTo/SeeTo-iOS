//
//  IdeasCell.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 06/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class IdeasCell : UITableViewCell {
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Category: UILabel!
    @IBOutlet weak var like_btn: UIImageView!
    @IBOutlet weak var like_total: UILabel!
    @IBOutlet weak var comment_total: UILabel!
    @IBOutlet weak var share_btn: UIImageView!
    @IBOutlet weak var rank: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
//        bounds = bounds.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
}

