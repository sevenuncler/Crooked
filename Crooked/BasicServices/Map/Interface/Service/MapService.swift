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

class MapServiceImpl: Service, MapService, MKMapViewDelegate {
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
        
    }
}
