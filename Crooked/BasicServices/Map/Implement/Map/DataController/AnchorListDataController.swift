//
//  AnnotationDataController.swift
//  Crooked
//
//  Created by fanghe on 2021/12/15.
//

import Foundation
import UIKit

enum AnnotationDataNotifyType {
    case Refresh
    case LoadMore
    case Delete
    case Insert
    case Replace
}

typealias AnnotationCompletion = (Error?, [Any]) -> Void
typealias AnnotationNotifyHandler = (AnnotationDataNotifyType, [Any]?) -> Void

class AnchorListRequest {
    
}

class AnchorListDataController {
    var allAnnotations: [AnchorProtocol]?
    var videoAnnotations: [AnchorProtocol]?
    lazy var registeredBlocks: [AnnotationNotifyHandler] = {
        return []
    }()
    
    func refresh(completion: @escaping AnnotationCompletion) {
        let anchor = Anchor.init()
        anchor.title = "尚月阁"
        let anchor1 = Anchor.init()
        anchor.title = "尚月阁"
        let anchor2 = Anchor.init()
        anchor.title = "尚月阁"
        let anchor3 = Anchor.init()
        anchor.title = "尚月阁"
        let anchor4 = Anchor.init()
        anchor.title = "尚月阁"
        let anchor5 = Anchor.init()
        anchor.title = "尚月阁"
        let list: [AnchorProtocol] = [anchor, anchor1, anchor2, anchor3, anchor4, anchor5]
        allAnnotations = list
        completion(nil, list)
        notify(models: list, type: .Refresh)
    }
    
    func refresh(_ request: AnchorListRequest, completion: @escaping AnnotationCompletion) {
        
    }
    
    func loadMore(completion: @escaping AnnotationCompletion) {
        
    }
    
    func insert(_ model: AnchorProtocol) -> Bool {
        return true
    }
    
    func delete(_ model: AnchorProtocol) -> Bool {
        return true
    }
    
    func update(_ model: AnchorProtocol) -> Bool {
        return true
    }
    
    func notify(models: [AnchorProtocol]?, type: AnnotationDataNotifyType) {
        for handler in registeredBlocks {
            handler(type, models)
        }
    }
    
    func registerBlock(handler: @escaping AnnotationNotifyHandler) {
        registeredBlocks.append(handler)
    }
    
    func unRigisterBlock(handler: @escaping AnnotationNotifyHandler) {
    }
}
