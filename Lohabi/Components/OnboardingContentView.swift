//
//  OnboardingContentView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 31/12/2023.
//

import SwiftUI

struct OnboardingContentView: View {
    var imageName: String
    var title: LocalizedStringKey
    var description: LocalizedStringKey

    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.blue)
                .frame(width: UIScreen.main.bounds.width, height: 350)
                .background(.gray)
            ScrollView {
                VStack(spacing: 24) {
                    Text(title)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .bold()
                    Text(description)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top, 1.0)
                }
                .padding(.top, 48)
                .padding(.horizontal, 24)
            }
        }
        .edgesIgnoringSafeArea([.top])
    }
}

#Preview {
    OnboardingContentView(imageName: "TestImage", title: "Titel", description: "Description")
}
