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
    
    var body: some View {
        Button(action: action, label: {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(16)
        })
        .padding(.horizontal, 24)
    }
}
