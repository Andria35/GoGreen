//
//  NearMeViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 01.02.24.
//

import UIKit
import MapKit

final class NearMeViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    // MARK: - Class Properties
    let locationManager = CLLocationManager()
    var shouldFollowUserLocation = true

    // MARK: - UI Components
    private let mapView = MKMapView()

    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapView()
        
        // Request location permissions
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Set up MapView
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    // CLLocationManagerDelegate method to handle location updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first?.coordinate {
            // Set the region to show the user's location only if shouldFollowUserLocation is true
//            if shouldFollowUserLocation {
//                let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
//                mapView.setRegion(region, animated: true)
//            }
            let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            
            // Perform a search for plant stores
            searchForPlantStores(near: userLocation)
        }
    }
    
    func searchForPlantStores(near location: CLLocationCoordinate2D) {
        // Create a search request
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "plant shop"
        request.region = mapView.region
        
        // Perform the search
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Remove previous annotations
            self.mapView.removeAnnotations(self.mapView.annotations)
            
            // Process the search results
            for item in response.mapItems {
                // You can access information about each result using item.name, item.placemark, etc.
                // Here, we add an annotation for each result on the map.
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                self.mapView.addAnnotation(annotation)
            }
        }
    }
        
    func setupMapView() {
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }}
