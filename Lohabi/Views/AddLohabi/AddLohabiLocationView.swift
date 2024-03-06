//
//  AddLohabiView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 28/12/2023.
//

import SwiftUI
import MapKit

struct AddLohabiLocationView: View {
    @Environment(LocationManager.self) var locationManager
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @State private var selectedLocation: LocationInfo?
    @State private var selectedLocationId: UUID?
    @State private var locations: [LocationInfo] = []
    
    @State private var showingLohabiLocationSheet = false
    @State private var navigateToAddLohabiSummaryView = false

    
    var body: some View {
        LohabiNavigationStack {
            ScrollView {
                VStack {
                    ForEach(locations) { location in
                        LocationRow(location: location, isSelected: selectedLocationId == location.id) {
                            self.selectedLocationId = location.id
                            self.selectedLocation = location
                            self.showingLohabiLocationSheet = true
                        }
                    }
                }
                .padding(.vertical, 24)
            }
            .padding()
            .navigationTitle(navigateToAddLohabiSummaryView ? LocalizedStringKey("Back") : LocalizedStringKey("Add Lohabi"))
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                Task {
                    await searchLocationsByText()
                }
            }
            .navigationDestination(isPresented: $navigateToAddLohabiSummaryView) {
                AddLohabiSummaryView(selectedLocation: selectedLocation)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
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
        .sheet(isPresented: $showingLohabiLocationSheet, onDismiss: clearSelectedLocationId) {
            Spacer()
            VStack {
                HStack {
                    Text(selectedLocation?.streetName ?? "Location not found")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                        .bold()
                        .lineLimit(1)
                        .truncationMode(.middle)
                    Spacer()
                    Button(action: {
                        self.showingLohabiLocationSheet = false
                    }) {
                        Text("Cancel")
                    }
                }
                .padding()
                LohabiLocationMapView(coordinates: selectedLocation?.coordinates, setMapMarker: true )
                    .padding(.horizontal, 24)
                Spacer()
                LohabiPrimaryButton(text: "Confirm", action: {
                    self.showingLohabiLocationSheet = false
                    self.navigateToAddLohabiSummaryView = true
                })
            }
            .presentationDragIndicator(.visible)
            .presentationDetents([.height(390), .medium, .medium])
        }

    }
    
    private func clearSelectedLocationId() {
        self.selectedLocationId = nil
    }
    
    private func searchLocationsByText() async {
        guard let locations = await locationManager.updateSearchResults(searchText: searchText) else {
            print("No locations found or an error occurred.")
            return
        }
        self.locations = locations
    }
}

#Preview {
    AddLohabiLocationView()
        .environment(LocationManager())
}
