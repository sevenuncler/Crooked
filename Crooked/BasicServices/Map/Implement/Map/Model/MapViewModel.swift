//
//  MapViewModel.swift
//  Crooked
//
//  Created by fanghe on 2021/12/7.
//

import Foundation


class MapViewModel {
    var mapApi: MapApi?
    var anchors: [Anchor]?
    var dataController: AnchorListDataController
    
    init(dataController: AnchorListDataController) {
        self.dataController = dataController
    
    }
    
    // Network
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
