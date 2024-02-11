//
//  NearMeViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 01.02.24.
//

import UIKit
import MapKit

final class NearMeViewController: UIViewController {
    
    // MARK: - Class Properties
    private let locationManager = CLLocationManager()
    
    // MARK: - UI Components
    private let mapView = MKMapView()
    
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    
    // MARK: - Setup UI
    private func setupUI() {
        setupSubViews()
        setupBackground()
        setupLocationManager()
        setupMapView()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor.systemBackground
    }
    
    private func setupSubViews() {
        view.addSubview(mapView)
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func setupMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupMapViewConstraints()
    }
    
    private func setupMapViewConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - Class Methods
    private func searchForPlantStores(near location: CLLocationCoordinate2D) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "plant shop"
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            self.mapView.removeAnnotations(self.mapView.annotations)
            
            for item in response.mapItems {
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                self.mapView.addAnnotation(annotation)
            }
        }
    }
}

// MARK: - MKMapView Delegate, CLLocationManager Delegate
extension NearMeViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first?.coordinate {
            let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            searchForPlantStores(near: userLocation)
        }
    }
}

