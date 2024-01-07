//
//  LocationPermissionView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 31/12/2023.
//

import SwiftUI

struct FinishedView: View {
    @Environment(UserDefaultsManager.self) var userDefaultsManager
    @Environment(OnboardingManager.self) var onboardingManager
    
    var body: some View {
        ZStack(alignment: .bottom) {
            OnboardingContentView(imageName: "OnboardingWelcome", title: "All Done!", description: "You are all set to be able to measure you location habit!")
            VStack {
                LohabiPrimaryButton(text: "All Done") {
                    userDefaultsManager.needsOnboarding = false
                }
                .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    FinishedView()
        .environment(OnboardingManager())
        .environment(UserDefaultsManager())
}
