//
//  LocationManager.swift
//  Lohabi
//
//  Created by Stefan de Gier on 04/01/2024.
//

import Foundation
import CoreLocation
import UIKit
import SwiftUI
import MapKit

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    
    var locationStatus: CLAuthorizationStatus = .notDetermined
    var lastKnownLocation: CLLocation?
    var nearestLocations: [LocationInfo] = []

    override init() {
        super.init()
        locationManager.delegate = self
        updateLocationStatus(locationManager.authorizationStatus)
    }

    func updateSearchResults(searchText: String) {
        guard !searchText.isEmpty else {
            self.nearestLocations = []
            return
        }

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText

        if let location = lastKnownLocation {
            print("Ga ik hier in?")
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
            request.region = region
        }
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else {
                print("Er is een fout opgetreden: \(error?.localizedDescription ?? "Onbekende fout")")
                return
            }
            
            let places = response.mapItems.map { item in
                LocationInfo(
                    streetName: item.placemark.name ?? "Onbekende plaats",
                    city: item.placemark.locality ?? "Onbekende stad",
                    coordinates: item.placemark.coordinate
                )
            }
            
            DispatchQueue.main.async {
                self.nearestLocations = places
            }
        }
    }

    public func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    public func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
        if locationStatus == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        } else {
            print("Developer Alert: .authorizedWhenInUse permission is required before requesting .authorizedAlways. The current status is: \(locationStatus)")
        }
    }

    private func updateLocationStatus(_ status: CLAuthorizationStatus) {
        switch status {
        case .denied:
            locationStatus = .denied
        case .notDetermined:
            locationStatus = .notDetermined
        case .authorizedWhenInUse:
            locationStatus = .authorizedWhenInUse
        case .authorizedAlways:
            locationStatus = .authorizedAlways
        case .restricted:
            locationStatus = .restricted
        default:
            locationStatus = .notDetermined
        }
    }
    
    // CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first
        print(lastKnownLocation ?? "niks")
    }
    
    internal func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        updateLocationStatus(manager.authorizationStatus)
    }
    
}
