//
//  User.swift
//  Crooked
//
//  Created by fanghe on 2021/12/7.
//

import UIKit

enum Gender {
    case Male
    case Female
    case Unknown
}

class Avatar: NSObject {
    var thumb: NSString?
    var large: NSString?
    var media: NSString?
}

class User: NSObject {
    var uid: String?
    var secUid: String?
    var nickname: String?
    var remarkName: String?
    var gender: Gender?
    var avatar: Avatar?
    
    override init() {
        
    }
}
