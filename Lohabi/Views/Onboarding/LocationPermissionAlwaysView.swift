//
//  LocationPermissionAlways.swift
//  Lohabi
//
//  Created by Stefan de Gier on 04/01/2024.
//

import SwiftUI

struct LocationPermissionAlwaysView: View {
    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var onboardingManager: OnboardingManager
    
    @State private var isLoading = false
    @State private var showAlert = false

    var body: some View {
        ZStack(alignment: .bottom) {
            OnboardingContentView(imageName: "OnboardingLocationPermissionAlways", title: "Location Permission in the Background", description: "We need the permission 'Change to Always Allow' in order to verify that you are at the correct location for the measurement, even if your not using your iPhone.")
            VStack(spacing: 0) {
                LohabiPrimaryButton(text: "Allow Always Location Access", action:  {
                    isLoading = true
                    locationManager.requestAlwaysAuthorization()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        isLoading = false
                        if locationManager.locationStatus != .authorizedAlways {
                            showAlert = true
                        }
                    }
                }, isLoading: isLoading, loadingText: "Checking Permissions...")
                .padding(.vertical, 8)
                LohabiSecondaryButton(text: "Enable Later in Settings") {
                    onboardingManager.onboardingStep = .locationPermissionBySettingsStep
                }
                .padding(.vertical, 8)
            }
            .alert("Wrong Permission", isPresented: $showAlert) {
                Button(action: {
                    onboardingManager.onboardingStep = .locationPermissionBySettingsStep
                }, label: {
                    Text("Okay")
                })
            } message: {
                Text("To give the 'Always' permission, we need the 'Only While Using App' permission.")
            }
        }
    }
}

#Preview {
    LocationPermissionAlwaysView()
        .environmentObject(LocationManager())
        .environmentObject(OnboardingManager())
}
