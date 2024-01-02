//
//  LocationPermissionView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 31/12/2023.
//

import SwiftUI

struct LocationPermissionView: View {
    @EnvironmentObject var onboardingManager: OnboardingManager

    var body: some View {
        ZStack(alignment: .bottom) {
            OnboardingContentView(imageName: "OnboardingLocationPermission", title: "Location Permission", description: "To ensure the app accurately verifies your location even when you're not actively using your iPhone, we need your permission to constantly access your location.")
            VStack(spacing: 0) {
                LohabiPrimaryButton(text: "Always Allow Location Access") {
                    //onboardingManager.onboardingStep = .finishedStep
                }
                .padding(.vertical, 8)
                LohabiSecondaryButton(text: "Enable Later in Settings") {
                    
                }
                .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    LocationPermissionView()
        .environmentObject(OnboardingManager())
}
