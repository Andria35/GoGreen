//
//  NearMeViewController+MapKit.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 01.02.24.
//

import UIKit
import MapKit

extension NearMeViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first?.coordinate {
            let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            searchForPlantStores(near: userLocation)
        }
    }
}
