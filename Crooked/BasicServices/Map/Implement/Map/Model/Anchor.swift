//
//  Anchor.swift
//  Crooked
//
//  Created by fanghe on 2021/12/7.
//

import UIKit

enum AnchorType {
    case Arrived
    case Video
    case Audio
}

class Anchor: NSObject {
    var author: User?
    var title: String? // 昵称
    var type: AnchorType? // 类型
    var longtitude: Float?
    var latitude: Float?
    override init() {
        
    }
}
