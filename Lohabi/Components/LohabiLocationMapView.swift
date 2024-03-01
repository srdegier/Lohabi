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
    
    var body: some View {
        if let coordinates = self.coordinates {
            Map {
                MapCircle(center: coordinates, radius: CLLocationDistance(75))
                    .foregroundStyle(.blue.opacity(0.60))
                    .mapOverlayLevel(level: .aboveLabels)
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
