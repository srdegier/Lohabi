//
//  LocationPermissionBySettingsView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 04/01/2024.
//

import SwiftUI

struct LocationPermissionBySettingsView: View {
    @Environment(LocationManager.self) var locationManager
    @Environment(UserDefaultsManager.self) var userDefaultsManager

    var body: some View {
        ZStack(alignment: .bottom) {
            OnboardingContentView(imageName: "OnboardingLocationPermissionBySettings", title: "No Full Location Access", description: "To be able to use Lohabi properly we need full location access. Please select the 'Always' option in Lohabi app settings.")
            VStack(spacing: 0) {
                LohabiPrimaryButton(text: "Open App Settings") {
                    if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(appSettings) {
                            UIApplication.shared.open(appSettings)
                        }
                    }
                }
                .padding(.vertical, 8)
                LohabiSecondaryButton(text: "Enable Later in Settings") {
                    userDefaultsManager.needsOnboarding = false
                }
                .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    LocationPermissionBySettingsView()
        .environment(LocationManager())
        .environment(UserDefaultsManager())
}
