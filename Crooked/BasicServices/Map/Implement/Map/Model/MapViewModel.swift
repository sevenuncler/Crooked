//
//  MapViewModel.swift
//  Crooked
//
//  Created by fanghe on 2021/12/7.
//

import Foundation


class MapViewModel {
    var mapApi: MapApi?
    // Network
    func fetchAnchors(finish: (Bool, [Anchor]) -> Void) {
        let request = AnchorRequest()
        mapApi?.fetchAnchors(request: request, success: { anchorResponse in
            finish(true, [])
        }, failure: { error in
            finish(false, [])
        })
    }
}
