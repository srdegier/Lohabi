//
//  AddLohabiView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 02/03/2024.
//

import SwiftUI

struct AddLohabiSummaryView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State var selectedLocation: LocationInfo?
    @State private var measurementRadius: Double = 75
    @State private var enteredNotification = true
    @State private var measurementStartedNotification = true

    private let measurementRadiusMin: Double = 100
    private let measurementRadiusMax: Double = 1000

    var body: some View {
        LohabiNavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack {
                        sectionTileName
                        sectionTileRadius
                        sectionTileNotifications
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 24)
                    .padding(.bottom, 110)
                    .navigationTitle("Summary")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                footerButtonView
            }
            .ignoresSafeArea(edges: [.bottom])
        }
    }
    
    private var isNameTooLong: Bool {
        name.count > 15
    }
    
    private var footerButtonView: some View {
        RoundedRectangle(cornerRadius: 80)
            .fill(BackgroundStyle())
            .frame(maxWidth: .infinity, maxHeight: 110)
            .shadow(radius: 0.5)
            .overlay(
                LohabiPrimaryButton(text: "Save") {
                    
                }
            )
    }
    
    private var sectionTileName: some View {
        LohabiSectionTile(title: "Name") {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.leading)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .onChange(of: name) {
                    if isNameTooLong {
                        name = String(name.prefix(15))
                    }
                }
            if isNameTooLong {
                Text("Name must be 15 characters or less.")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
    
    private var sectionTileRadius: some View {
        LohabiSectionTile(titleDynamic: selectedLocation?.streetName) {
            LohabiLocationMapView(
                coordinates: selectedLocation?.coordinates,
                setMapCircle: true,
                mapCircleRadius: measurementRadius
            )
            Text("This is the radius of the zone you must enter for the measurement to begin. You can adjust the desired radius using the slider.")
                .font(.caption)
            Slider(
                value: $measurementRadius,
                in: measurementRadiusMin...measurementRadiusMax,
                step: 100
            )
            Text("\(measurementRadius, specifier: "%.0f") meter")
                .font(.footnote)
        }
    }
    
    private var sectionTileNotifications: some View {
        LohabiSectionTile(title: "Notifications") {
            Toggle("Entered", isOn: $enteredNotification)
            Divider()
            Toggle("Measurement started", isOn: $measurementStartedNotification)
        }
    }
}

