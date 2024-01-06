//
//  ParentalPermissionView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 06/01/2024.
//

import SwiftUI

struct ParentalPermissionView: View {
    @State var isLoading = false
    var body: some View {
        OnboardingContentView(iconName: "lock.circle", title: "Parental Control", description: "Due Parental Control settings we cannot ask your location permissions. You may not access Lohabi.")
        LohabiPrimaryButton(text: "Try Again", action:  {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isLoading = false
            }
        }, isLoading: isLoading, loadingText: "Checking Permissions...")
    }
}

#Preview {
    ParentalPermissionView()
}
