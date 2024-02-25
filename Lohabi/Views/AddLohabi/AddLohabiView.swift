//
//  AddLohabiView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 28/12/2023.
//

import SwiftUI

struct AddLohabiView: View {
    @Environment(LocationManager.self) var locationManager
    @State private var searchText = ""
    @State private var selectedLocation: LocationInfo?
    @State private var locations: [LocationInfo] = []
    
    var body: some View {
        LohabiNavigationStack {
            ScrollView {
                VStack {
                    ForEach(locationManager.nearestLocations) { location in
                        LocationRow(location: location, isSelected: selectedLocation?.id == location.id) {
                            self.selectedLocation = location
                        }
                    }
                }
                .padding(.vertical, 24)
            }
            .padding()
            .navigationTitle("Add Lohabi")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                self.locationManager.updateSearchResults(searchText: searchText)
            }
        }
        .overlay {
            if locationManager.nearestLocations.isEmpty {
                ContentUnavailableView {
                    Label(LocalizedStringKey("Search an address"), systemImage: "location.magnifyingglass")
                } description: {
                    Text(LocalizedStringKey("Enter the address where you want the measurement to take place."))
                }
            }
        }
    }
}

#Preview {
    AddLohabiView()
        .environment(LocationManager())
}
