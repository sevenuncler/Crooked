//
//  NearestBaseCell.swift
//  Crooked
//
//  Created by fanghe on 2021/12/5.
//

import UIKit

class NearestBaseCell: UITableViewCell {
    var model: Any?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func reuseID() -> String {
        return "NearestBaseCell"
    }
    
    func refresh(model: Any) {
        self.model = model
    }

}
