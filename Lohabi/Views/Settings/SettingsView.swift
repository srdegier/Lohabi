//
//  SettingsView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 28/12/2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var defaultsManager: UserDefaultsManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        LohabiNavigationStack {
            LohabiPrimaryButton(text: "Onboarding Reset") {
                defaultsManager.needsOnboarding = true
                dismiss()
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(UserDefaultsManager())
}
