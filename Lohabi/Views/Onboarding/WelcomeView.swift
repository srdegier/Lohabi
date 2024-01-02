//
//  WelcomeView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 31/12/2023.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var onboardingManager: OnboardingManager

    var body: some View {
        ZStack(alignment: .bottom) {
            OnboardingContentView(imageName: "OnboardingWelcome", title: "Welcome at Lohabi", description: "Let's start by setting up some important settings so that the app functions properly."  )
            VStack {
                LohabiPrimaryButton(text: "Next") {
                    onboardingManager.onboardingStep = .locationPermissionStep
                }
                .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(OnboardingManager())
}
