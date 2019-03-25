//
//  TodoDetailCell.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 25/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import DLRadioButton

class TodoDetailCell : UITableViewCell {
    @IBOutlet weak var todo_checkbox: DLRadioButton!
    @IBOutlet weak var todo_content: UILabel!
}
