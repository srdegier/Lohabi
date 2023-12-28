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
            ZStack(alignment: .bottomLeading) {
                ScrollView() {
                    // Demo for Lohabi cards
                    VStack(spacing: 24) {
                        ForEach(0 ..< 6) { item in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .frame(height: 130)
                                .shadow(radius: 0.5)
                        }
                    }
                    .padding(24)
                }
                .padding(.bottom, 70)
                ZStack {
                    RoundedRectangle(cornerRadius: 80)
                        .fill(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .shadow(radius: 0.5)
                    Button(action: {
                
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                            .frame(width: 70, height: 70)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    .offset(y: -30)

                }
            }
            .navigationTitle("Lohabi")
            .toolbarBackground(
                BackgroundStyle(),
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(Color(UIColor.secondarySystemBackground))
            .ignoresSafeArea(edges: [.bottom])
        }
    }
}

#Preview {
    ContentView()
}
