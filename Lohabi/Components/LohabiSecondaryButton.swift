//
//  LohabiSecondaryButton.swift
//  Lohabi
//
//  Created by Stefan de Gier on 02/01/2024.
//

import Foundation
import SwiftUI

struct LohabiSecondaryButton: View {
    var text: LocalizedStringKey
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(16)
                .frame(maxWidth: .infinity)
                .cornerRadius(16)
        })
        .padding(.horizontal, 24)
    }
}

#Preview {
    LohabiSecondaryButton(text: "Secondary Button", action: {})
}
