//
//  Colors.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 04/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

enum Color {
    case MINT,PURPLE,GREY,LIGHTPURPLE
    
    func getColor() -> UIColor{
        switch self {
        case .MINT:
            return UIColor(red: 167/255, green: 164/255, blue: 250/255, alpha: 1)
            
        case .PURPLE:
            return UIColor(red: 191/255, green: 155/255, blue: 248/255, alpha: 1)
            
        case .GREY:
            return UIColor(red: 149/255, green: 152/255, blue: 154/255, alpha: 1)
            
        case .LIGHTPURPLE:
            return UIColor(red: 216/194, green: 194/255, blue: 255/255, alpha: 1)
            
        }
        
    }
}
