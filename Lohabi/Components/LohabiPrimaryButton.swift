//
//  LohabiPrimaryButton.swift
//  Lohabi
//
//  Created by Stefan de Gier on 02/01/2024.
//

import Foundation
import SwiftUI

struct LohabiPrimaryButton: View {
    var text: LocalizedStringKey
    var action: () -> Void
    var isLoading: Bool = false
    var loadingText: LocalizedStringKey = "Loading..."

    var body: some View {
        Button(action: action) {
            HStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.5, anchor: .center)
                        .padding(.horizontal, 8)
                }
                Text(isLoading ? loadingText : text)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
        }
        .disabled(isLoading)
        .padding(16)
        .background(Color.blue)
        .cornerRadius(16)
        .padding(.horizontal, 24)
    }
}

#Preview {
    LohabiPrimaryButton(text: "Primary Button", action: {})
}
