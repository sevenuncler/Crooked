//
//  VideoAnnotationView.swift
//  Crooked
//
//  Created by fanghe on 2021/12/14.
//

import Foundation
import MapKit

class VideoAnnotationView: MKMarkerAnnotationView {
    var title: UILabel
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        title = UILabel()
        title.text = "title"
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        addSubview(title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return title.intrinsicContentSize
    }
}
