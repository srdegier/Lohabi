//
//  AddLohabiView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 28/12/2023.
//

import SwiftUI

struct AddLohabiView: View {
    @Environment(LocationManager.self) var locationManager
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @State private var selectedLocation: LocationInfo?
    @State private var locations: [LocationInfo] = []
    
    var body: some View {
        LohabiNavigationStack {
            ScrollView {
                VStack {
                    ForEach(locations) { location in
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
                Task {
                    await searchLocationsByText()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
        }
        .overlay {
            if locations.isEmpty {
                ContentUnavailableView {
                    Label(LocalizedStringKey("Search an address"), systemImage: "location.magnifyingglass")
                } description: {
                    Text(LocalizedStringKey("Enter the address where you want the measurement to take place."))
                }
            }
        }
    }
    
    func searchLocationsByText() async {
        guard let locations = await locationManager.updateSearchResults(searchText: searchText) else {
            print("No locations found or an error occurred.")
            return
        }

        self.locations = locations
    }
}

#Preview {
    AddLohabiView()
        .environment(LocationManager())
}
