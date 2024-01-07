//
//  OnboardingContentView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 31/12/2023.
//

import SwiftUI

struct OnboardingContentView: View {
    var imageName: String?
    var iconName: String?
    var title: LocalizedStringKey
    var description: LocalizedStringKey

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                if let imageName = imageName {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.blue)
                }
                if let iconName = iconName {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 350)
            ScrollView {
                VStack(spacing: 24) {
                    HStack {
                        Text(title)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .bold()
                    }

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
        .if(imageName != nil) {
            $0.edgesIgnoringSafeArea([.top])
        }
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct OnboardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContentView(imageName: "TestImage", iconName: nil, title: "Titel", description: "Description")
    }
}
