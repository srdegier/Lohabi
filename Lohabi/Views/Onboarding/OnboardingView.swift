//
//  OnboardingView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 31/12/2023.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var locationManager: LocationManager
    @Environment(OnboardingManager.self) var onboardingManager

    var body: some View {
        VStack {
            currentStepView()
                .environmentObject(LocationManager())
                .transition(.push(from: .trailing))
        }
        .animation(.default, value: onboardingManager.onboardingStep)
        .onChange(of: locationManager.locationStatus) {
            if onboardingManager.onboardingStep != .welcomeStep {
                let locationStatus = locationManager.locationStatus
                onboardingManager.onboardingStepByLocationStatus(locationStatus: locationStatus)
            }
        }
    }
    
    @ViewBuilder
    private func currentStepView() -> some View {
        switch onboardingManager.onboardingStep {
        case .welcomeStep:
            WelcomeView()
        case .locationPermissionWhenInUseStep:
            LocationPermissionWhenInUseView()
        case .locationPermissionAlwaysStep:
            LocationPermissionAlwaysView()
        case .locationPermissionBySettingsStep:
            LocationPermissionBySettingsView()
        case .finishedStep:
            FinishedView()
        }
    }
}

#Preview {
    OnboardingView()
        .environmentObject(LocationManager())
        .environment(OnboardingManager())
}
