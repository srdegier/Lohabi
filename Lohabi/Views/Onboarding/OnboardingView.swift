//
//  OnboardingView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 31/12/2023.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var onboardingManager: OnboardingManager

    var body: some View {
        VStack {
            currentStepView()
                // TODO: Inspect later which is better
                .transition(.push(from: .trailing))
//                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
        .animation(.default, value: onboardingManager.onboardingStep)
    }
    
    @ViewBuilder
    private func currentStepView() -> some View {
        switch onboardingManager.onboardingStep {
        case .welcomeStep:
            WelcomeView()
        case .locationPermissionStep:
            LocationPermissionView()
        case .finishedStep:
            FinishedView()
        }
    }
}

#Preview {
    OnboardingView().environmentObject(OnboardingManager())
}
