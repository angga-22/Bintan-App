//
//  LocationManager.swift
//  Test Map Routing
//
//  Created by Fauzi Achmad B D on 26/06/21.
//

import Foundation
import CoreLocation

struct Location {
    
    let title: String
    let coordinates: CLLocationCoordinate2D?
    
}

class LocationManager: NSObject {
    
    static let shared = LocationManager()
    
    
    public func findLocation(with query: String, completion: @escaping (([Location]) -> Void)){
        
        // Geocoding
        
        let geoCoder = CLGeocoder()
        
        let clRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 1.1367, longitude: 104.4258), radius: 6000, identifier: "Bintan")
        
        let locale = Locale(identifier: "id_ID")
        
        
        
        geoCoder.geocodeAddressString(query, in: clRegion, preferredLocale: locale ) { places, error in
        
            guard let places = places, error == nil else {
                completion([])
                return
            }
            
            print(places.first)
            
            
            
            let models: [Location] = places.compactMap ({ place in

                var name = ""

                if let locationName = place.name {
                    name += locationName
                }

                if let adminRegion = place.administrativeArea {
                    name += ", \(adminRegion)"
                }

                if let subAdminRegion = place.subAdministrativeArea{
                    name += ", \(subAdminRegion)"
                }

//                if let locality = place.locality {
//                    name += ", \(locality)"
//                }
//
//                if let country = place.country {
//                    name += ", \(country)"
//                }

                print("\n\(place)\n\n")

                let result = Location(title: name, coordinates: place.location?.coordinate)

                return result

            })
            
            completion(models)
            
        }
        
        
    }
    
    
}
