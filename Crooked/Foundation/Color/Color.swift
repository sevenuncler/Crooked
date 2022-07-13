//
//  Color.swift
//  Crooked
//
//  Created by fanghe on 2021/12/6.
//

import UIKit

class Color: NSObject {
    class func color(named: ColorName) -> UIColor {
        switch named {
        case .H1:
            return UIColor.systemGroupedBackground
        case .H2:
            return UIColor.systemGray
        case .H3:
            return UIColor.systemBrown
        case .P1:
            return UIColor.systemGray
        case .P2:
            return UIColor.systemGray2
        case .P3:
            return UIColor.systemGray3
        case .P4:
            return UIColor.systemGray4
        case .Background:
            return UIColor.systemGray5
        }
    }
    
    class func randomColor() -> UIColor {
        return UIColor.init(red: randomValue(), green: randomValue(), blue: randomValue(), alpha: randomValue())
    }
    
    class func randomValue() -> CGFloat {
        let value = arc4random() % 255;
        return CGFloat(Float(value) / 255.0);
    }
}
