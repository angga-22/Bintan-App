//
//  ItineraryStartPage.swift
//  Binary-App
//
//  Created by Dhea Luciany Januar on 15/06/21.
//


import UIKit
import MapKit
import CoreLocation
import FloatingPanel

class ItineraryViewController: UIViewController, MKMapViewDelegate, FloatingPanelControllerDelegate {

    @IBOutlet weak var mapKitView: MKMapView!

    
    private let locationManager = CLLocationManager()
    private let regionInMeters: Double = 8000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServices()
        mapKitView.delegate = self
        callFloatingPanel()
    }
    
    @IBAction func addItinerary(_ sender: Any) {
        
        performSegue(withIdentifier: "goToUserPreferences", sender: self)
    }
    
    
    func callFloatingPanel (){
        let floatingPanel = FloatingPanelController()
        guard let itineraryTableVC = storyboard?.instantiateViewController(identifier: "fpc_itineraryStartPage") as? ItineraryFPViewController else {
            return
        }
        floatingPanel.delegate = self
        floatingPanel.set(contentViewController: itineraryTableVC)
        floatingPanel.addPanel(toParent: self)
    }
    
    
   
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    
    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center:location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapKitView.setRegion(region, animated: true)
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
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapKitView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        @unknown default:
            break
        }
    }
}
    
extension ItineraryViewController: CLLocationManagerDelegate {
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters )
        mapKitView.setRegion(region, animated: true)
    }
        private func locationManager(_ manager: CLLocationManager, didChangeAuthorization: [CLAuthorizationStatus]){
    }
}

        
    
   
    
  
    
   
