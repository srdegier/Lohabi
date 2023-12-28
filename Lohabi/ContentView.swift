//
//  ContentView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 27/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddLohabiSheet = false
    
    var body: some View {
        LohabiNavigationStack {
            ZStack(alignment: .bottomLeading) {
                ScrollView() {
                    // Demo for Lohabi cards
                    VStack(spacing: 24) {
                        ForEach(0 ..< 6) { item in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(BackgroundStyle())
                                .frame(height: 130)
                                .shadow(radius: 0.5)
                        }
                    }
                    .padding(24)
                }
                .padding(.bottom, 70)
                ZStack {
                    RoundedRectangle(cornerRadius: 80)
                        .fill(BackgroundStyle())
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .shadow(radius: 0.5)
                    Button(action: {
                        showAddLohabiSheet.toggle()
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
            .navigationBarItems(trailing: settingsButton)
            .ignoresSafeArea(edges: [.bottom])
        }
        .sheet(isPresented: $showAddLohabiSheet) {
            AddLohabiView()
        }
    }
    
    var settingsButton: some View {
        NavigationLink(destination: SettingsView()) {
            Image(systemName: "gear")
                .imageScale(.large)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
