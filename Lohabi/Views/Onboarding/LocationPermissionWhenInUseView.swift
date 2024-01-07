//
//  LocationPermissionView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 31/12/2023.
//

import SwiftUI

struct LocationPermissionWhenInUseView: View {
    @Environment(LocationManager.self) var locationManager
    @Environment(OnboardingManager.self) var onboardingManager

    var body: some View {
        ZStack(alignment: .bottom) {
            OnboardingContentView(imageName: "OnboardingLocationPermission", title: "Location Permission", description: "We need the permission 'Allow While Using App' in order to verify that you are at the correct location for the measurement in the foreground.")
            VStack(spacing: 0) {
                LohabiPrimaryButton(text: "Allow While Using App") {
                    locationManager.requestWhenInUseAuthorization()
                }
                .padding(.vertical, 8)
                LohabiSecondaryButton(text: "Enable Later in Settings") {
                    onboardingManager.onboardingStep = .locationPermissionBySettingsStep
                }
                .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    LocationPermissionWhenInUseView()
        .environment(LocationManager())
        .environment(OnboardingManager())
}
