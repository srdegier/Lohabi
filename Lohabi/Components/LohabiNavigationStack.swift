//
//  CustomStackView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 28/12/2023.
//

import SwiftUI

struct LohabiNavigationStack<Content>: View where Content: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack {
            content
                .navigationBarTitle("Custom Navigation")
                .toolbarBackground(
                    BackgroundStyle(),
                    for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .background(Color(UIColor.secondarySystemBackground))
        }
    }
}
