//
//  ContentView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 27/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.secondarySystemBackground))
            .navigationTitle("Lohabi")
            .toolbarBackground(
                BackgroundStyle(),
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
