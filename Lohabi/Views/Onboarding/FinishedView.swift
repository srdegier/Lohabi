//
//  LocationPermissionView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 31/12/2023.
//

import SwiftUI

struct FinishedView: View {
    @EnvironmentObject var defaultsManager: UserDefaultsManager
    @EnvironmentObject var onboardingManager: OnboardingManager

    var body: some View {
        ZStack(alignment: .bottom) {
            OnboardingContentView(imageName: "TestImage", title: "", description: "")
            VStack {
                LohabiPrimaryButton(text: "All Done") {
                    defaultsManager.needsOnboarding = false
                }
                .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    FinishedView()
        .environmentObject(OnboardingManager())
        .environmentObject(UserDefaultsManager())
}
