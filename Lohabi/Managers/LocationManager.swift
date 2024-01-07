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

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    
    var locationStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        locationManager.delegate = self
        updateLocationStatus(locationManager.authorizationStatus)
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
    
    }
    
    internal func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        updateLocationStatus(manager.authorizationStatus)
    }
    
}
