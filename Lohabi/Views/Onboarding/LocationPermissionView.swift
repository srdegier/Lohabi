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
            OnboardingContentView(imageName: "TestImage", title: "", description: "")
            VStack {
                LohabiPrimaryButton(text: "Next") {
                    onboardingManager.onboardingStep = .finishedStep
                }
            }
        }
    }
}

#Preview {
    LocationPermissionView()
        .environmentObject(OnboardingManager())
}
