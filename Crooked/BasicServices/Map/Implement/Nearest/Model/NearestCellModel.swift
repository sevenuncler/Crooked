//
//  NearestCellModel.swift
//  Crooked
//
//  Created by fanghe on 2021/12/7.
//

import UIKit

class NearestCellModel: NSObject {
    var origin: Any?
    
    func reuseID() -> String {
        return NSStringFromClass(NearestBaseCell.self)
    }
}
