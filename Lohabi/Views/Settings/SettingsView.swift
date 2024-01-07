//
//  SettingsView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 28/12/2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(UserDefaultsManager.self) var userDefaultsManager: UserDefaultsManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        LohabiNavigationStack {
            LohabiPrimaryButton(text: "Onboarding Reset") {
                userDefaultsManager.needsOnboarding = true
                dismiss()
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
        .environment(UserDefaultsManager())
}
