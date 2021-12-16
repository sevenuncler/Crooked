//
//  VideoAnnotation.swift
//  Crooked
//
//  Created by fanghe on 2021/12/14.
//

import Foundation
import MapKit

class VideoAnnotation: NSObject, MKAnnotation {
    @objc dynamic var coordinate = CLLocationCoordinate2D(latitude: 37.779_379, longitude: -122.418_433)
    
    // Required if you set the annotation view's `canShowCallout` property to `true`
    var title: String? = NSLocalizedString("余杭", comment: "")
    
    // This property defined by `MKAnnotation` is not required.
    var subtitle: String? = "华元美林".localized(nil)
}
