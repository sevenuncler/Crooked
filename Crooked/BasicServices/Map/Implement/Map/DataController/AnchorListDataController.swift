//
//  AnnotationDataController.swift
//  Crooked
//
//  Created by fanghe on 2021/12/15.
//

import Foundation
import UIKit

enum AnnotationDataNotifyType {
    case AnnotationDataNotifyTypeRefresh
    case AnnotationDataNotifyTypeLoadMore
    case AnnotationDataNotifyTypeDelete
    case AnnotationDataNotifyTypeInsert
    case AnnotationDataNotifyTypeReplace
}

typealias AnnotationCompletion = (Error, [Any]) -> Void
typealias AnnotationNotifyHandler = (AnnotationDataNotifyType, [Any]) -> Void

class AnnotationRequest {
    
}

class AnchorListDataController {
    var allAnnotations: [AnchorProtocol]?
    var videoAnnotations: [AnchorProtocol]?
    var registeredBlocks: NSMutableArray?
    
    func refresh(_ request: AnnotationRequest, completion: @escaping AnnotationCompletion) {
        
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
    
    func notify(models: [AnchorProtocol]?, type: AnnotationDataNotifyType){
    }
    
    func registerBlock(handler: @escaping AnnotationNotifyHandler) {
        registeredBlocks?.add(handler)
    }
    
    func unRigisterBlock(handler: @escaping AnnotationNotifyHandler) {
        registeredBlocks?.remove(handler)
    }
}
