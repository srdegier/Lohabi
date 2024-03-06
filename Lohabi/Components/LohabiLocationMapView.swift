//
//  LohabiLocationMapView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 01/03/2024.
//

import SwiftUI
import MapKit

struct LohabiLocationMapView: View {
    var coordinates: CLLocationCoordinate2D?
    var setMapMarker: Bool = false
    var setMapCircle: Bool = false
    var mapCircleRadius: CLLocationDistance = 75
    // var mapCircleType:
    
    var body: some View {
        if let coordinates = self.coordinates {
            Map {
                if setMapMarker {
                    Marker("", coordinate: coordinates)
                }
                if setMapCircle {
                    MapCircle(center: coordinates, radius: CLLocationDistance(mapCircleRadius))
                        .foregroundStyle(.blue.opacity(0.60))
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .edgesIgnoringSafeArea(.all)
            .frame(height: 230)
            .mapStyle(.hybrid(elevation: .realistic))
        } else {
            ContentUnavailableView {
                Label(LocalizedStringKey("Unknown Location"), systemImage: "location.magnifyingglass")
            } description: {
                Text(LocalizedStringKey("There has been an error locating the location"))
            }
        }
    }
}

#Preview {
    LohabiLocationMapView()
}
