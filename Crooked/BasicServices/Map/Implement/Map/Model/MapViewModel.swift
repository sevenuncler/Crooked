//
//  MapViewModel.swift
//  Crooked
//
//  Created by fanghe on 2021/12/7.
//

import Foundation
import UIKit


typealias MapViewModelCompletion = ()->Void

class MapViewModel {
    var dataController: AnchorListDataController
    var mapApi: MapApi?
    var anchors: [Anchor]?

    init(dataController: AnchorListDataController) {
        self.dataController = dataController
        self.dataController.registerBlock { type, list in
            
        }
    }
    
    // Network
    func fetch(position: Any, completion: MapViewModelCompletion?) {
        dataController.refresh(AnchorListRequest(), completion: { error, list in
            
        })
    }
    
    
    func fetchAnchors(finish: (Bool, [Anchor]?) -> Void) {
        let request = AnchorRequest()
        mapApi?.fetchAnchors(request: request, success: { anchorResponse in
            self.anchors = anchorResponse.anchors
            finish(true, anchors)
        }, failure: { error in
            finish(false, [])
        })
    }
    
    func loadMoreAnchors(finish: (Bool, [Anchor]?) -> Void) {
        let request = AnchorRequest()
        mapApi?.fetchAnchors(request: request, success: { anchorResponse in
            self.anchors = anchorResponse.anchors
            finish(true, anchors)
        }, failure: { error in
            finish(false, [])
        })
    }
}
