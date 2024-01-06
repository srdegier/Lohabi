//
//  OnboardingManager.swift
//  Lohabi
//
//  Created by Stefan de Gier on 02/01/2024.
//

import Foundation
import SwiftUI
import CoreLocation

public enum OnboardingStep: Comparable, Codable {
    case welcomeStep, locationPermissionWhenInUseStep, locationPermissionAlwaysStep, locationPermissionBySettingsStep, finishedStep
}

class OnboardingManager: ObservableObject {
    @Published var onboardingStep: OnboardingStep = .welcomeStep
    
    func onboardingStepByLocationStatus(locationStatus: CLAuthorizationStatus) {
        switch locationStatus {
            case .notDetermined:
                onboardingStep = .locationPermissionWhenInUseStep
            case .authorizedWhenInUse:
                onboardingStep = .locationPermissionAlwaysStep
            case .authorizedAlways:
                onboardingStep = .finishedStep
            case .restricted:
                // parental restrictions
                onboardingStep = .finishedStep
            case .denied:
                onboardingStep = .locationPermissionBySettingsStep
            @unknown default: break
            
        }
    }
}
