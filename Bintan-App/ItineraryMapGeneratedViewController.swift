//
//  ItineraryMapViewController.swift
//  Bintan-App
//
//  Created by angga saputra on 26/06/21.
//

import UIKit
import MapKit
import CoreLocation
import FloatingPanel

class ItineraryMapGeneratedViewController: UIViewController,  MKMapViewDelegate, FloatingPanelControllerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    private var clLocation = CLLocationManager()
    private var regionInMeters: Double = 10000
    let yourLocation = CLLocationCoordinate2D(latitude: 1.134653760557423, longitude:  104.59332120145761)
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        self.mapView.showsUserLocation = true
        displayMultipleLocation()
        let annotation = MKPointAnnotation()
        annotation.title = "your current location"
        annotation.coordinate = yourLocation
        mapView.addAnnotation(annotation)
        clLocation.delegate = self
        callFloatingPanel()
//        clLocation.desiredAccuracy = kCLLocationAccuracyBest
//        clLocation.requestAlwaysAuthorization()
//        clLocation.requestWhenInUseAuthorization()
//        clLocation.startUpdatingLocation()
    }
    
    func displayMultipleLocation(){
        let locations = [
            ["title": "Pengudang Beach", "latitude": 1.1690511905710803, "longitude": 104.4994162939152],
            ["title": "Safari Lagoi Beach", "latitude": 1.142752613324396, "longitude": 104.35830046891586],
            ["title": "Sakerah Beach", "latitude": 1.1255566936147328, "longitude": 104.26112994090528],
        ]
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location["title"] as? String
            let loc = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            annotation.coordinate = loc
            mapView.addAnnotation(annotation)
        }
    }
    
    
    
    func setupLocationManager(){
        clLocation.delegate = self
        clLocation.desiredAccuracy = kCLLocationAccuracyBest
    }

    
    func centerViewOnUserLocation(){
        if let location = clLocation.location?.coordinate {
            let region = MKCoordinateRegion.init(center:location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //show alert to turn location on
        }
    }
        
   
    func checkLocationAuthorization(){
        switch clLocation.authorizationStatus {
        case .notDetermined:
           clLocation.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            clLocation.startUpdatingLocation()
            break
        @unknown default:
            break
        }
    }

    func callFloatingPanel (){
        let floatingPanel = FloatingPanelController()
        guard let itineraryTableVC = storyboard?.instantiateViewController(identifier: "ItineraryMapGeneratedFPViewController") as? ItineraryMapGeneratedFPViewController else {
            return
        }
        floatingPanel.delegate = self
        floatingPanel.set(contentViewController: itineraryTableVC)
        floatingPanel.addPanel(toParent: self)
    }
    
   
}

extension ItineraryMapGeneratedViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters )
        mapView.setRegion(region, animated: true)
    }
        private func locationManager(_ manager: CLLocationManager, didChangeAuthorization: [CLAuthorizationStatus]){
    }
    

}
