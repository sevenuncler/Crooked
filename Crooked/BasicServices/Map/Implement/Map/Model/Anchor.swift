//
//  Anchor.swift
//  Crooked
//
//  Created by fanghe on 2021/12/7.
//

import UIKit

enum AnchorType {
    case ArrivedToDiscover
    case ArrivedToWatch
    case Video
    case Audio
}

protocol AnchorProtocol {
    
}

class Anchor: AnchorProtocol {
    var author: User?
    var title: String? // 昵称
    var type: AnchorType? // 类型
    var longtitude: Float?
    var latitude: Float?
}
