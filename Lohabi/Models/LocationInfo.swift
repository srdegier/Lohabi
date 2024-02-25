//
//  LocationInfo.swift
//  Lohabi
//
//  Created by Stefan de Gier on 07/01/2024.
//

import Foundation
import CoreLocation

struct LocationInfo: Identifiable {
    let id = UUID()
    let streetName: String
    let city: String
    let coordinates: CLLocationCoordinate2D
}
