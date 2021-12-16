//
//  MapService.swift
//  Crooked
//
//  Created by fanghe on 2021/11/29.
//
import UIKit
import MapKit

protocol MapService: IService {
    func checkRights() -> Bool
    func requestRights()
    func loadMap(_ mode : MapModel) -> UIView?
    func update(mode : MapModel)
}

class MapServiceImpl: Service, MapService {
    var mapView: MKMapView?
    lazy var locationManager: CLLocationManager = {
        let locationM = CLLocationManager()
        if #available(iOS 8.0, *) {
            locationM.requestAlwaysAuthorization()
        }
        return locationM
    }()
    
    override init() {
        super.init()
        mapView = MKMapView(frame: UIScreen.main.bounds);
        let wrappedMap = mapView!
        wrappedMap.mapType = MKMapType.standard
        wrappedMap.showsBuildings = true
        
        if #available(iOS 9.0, *) {
            wrappedMap.showsCompass = true
            wrappedMap.showsScale = true
            wrappedMap.showsTraffic = true
        }
        
        wrappedMap.showsUserLocation = true
        wrappedMap.delegate  = self
        wrappedMap.register(VideoAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(VideoAnnotation.self))
        wrappedMap.addAnnotations([BridgeAnnotation(),
                                   CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: 38.810_000, longitude: -122.477_450)),
                                   FerryBuildingAnnotation(),
                                  SanFranciscoAnnotation(),
                                  VideoAnnotation()])
    }
    
    func checkRights() -> Bool {
        return true
    }
    
    func requestRights() {
        
    }
    
    func loadMap(_ model : MapModel) -> UIView? {
        return mapView
    }
    
    func update(mode : MapModel) {
        let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
        let center = CLLocationCoordinate2D(latitude: 37.786_996, longitude: -122.440_100)
        mapView?.setRegion(MKCoordinateRegion(center: center, span: span), animated: true)
    }
}

extension MapServiceImpl: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            // Make a fast exit if the annotation is the `MKUserLocation`, as it's not an annotation view we wish to customize.
            return nil
        }
        
        let identifier = NSStringFromClass(VideoAnnotation.self)
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
        if let markerAnnotationView = view as? MKMarkerAnnotationView {
            markerAnnotationView.animatesWhenAdded = true
            markerAnnotationView.canShowCallout = true
            markerAnnotationView.markerTintColor = UIColor(named: "internationalOrange")
            
            /*
             Add a detail disclosure button to the callout, which will open a new view controller or a popover.
             When the detail disclosure button is tapped, use mapView(_:annotationView:calloutAccessoryControlTapped:)
             to determine which annotation was tapped.
             If you need to handle additional UIControl events, such as `.touchUpOutside`, you can call
             `addTarget(_:action:for:)` on the button to add those events.
             */
            let rightButton = UIButton(type: .detailDisclosure)
            markerAnnotationView.rightCalloutAccessoryView = rightButton
        }
        return view
    }
}
