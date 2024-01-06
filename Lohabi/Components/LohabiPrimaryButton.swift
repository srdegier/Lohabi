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
            if isLoading {
                HStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.5, anchor: .center)
                        .padding(.horizontal, 8)
                    Text(loadingText)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            } else {
                Text(text)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .disabled(isLoading)
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(16)
        .padding(.horizontal, 24)
    }
}
