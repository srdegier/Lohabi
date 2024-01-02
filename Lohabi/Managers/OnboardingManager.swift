//
//  OnboardingManager.swift
//  Lohabi
//
//  Created by Stefan de Gier on 02/01/2024.
//

import Foundation
import SwiftUI

public enum OnboardingStep: Comparable, Codable {
    case welcomeStep, locationPermissionStep, finishedStep
}

class OnboardingManager: ObservableObject {
    @Published var onboardingStep: OnboardingStep = .welcomeStep
}
