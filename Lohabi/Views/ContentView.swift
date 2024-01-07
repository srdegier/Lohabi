//
//  ContentView.swift
//  Lohabi
//
//  Created by Stefan de Gier on 27/12/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(UserDefaultsManager.self) var userDefaultsManager
    
    @State private var onboardingManager = OnboardingManager()
    @State private var showAddLohabiSheet = false
    
    var body: some View {
        @Bindable var userDefaultsManager = userDefaultsManager
        
        LohabiNavigationStack {
            ZStack(alignment: .bottom) {
                //lohabiScrollView
                lohabiEmptyView
                addFooterView
            }
            .navigationTitle("Lohabi")
            .navigationBarItems(trailing: settingsButton)
            .ignoresSafeArea(edges: [.bottom])
        }
        .sheet(isPresented: $showAddLohabiSheet) {
            AddLohabiView()
        }
        .fullScreenCover(isPresented: $userDefaultsManager.needsOnboarding, content: {
            OnboardingView()
                .environment(onboardingManager)
        })
    }
    
    var settingsButton: some View {
        NavigationLink(destination: SettingsView()) {
            Image(systemName: "gear")
                .imageScale(.large)
                .padding()
        }
    }
    
    var lohabiScrollView: some View {
        ScrollView() {
            lohabiCellsView
        }
        .padding(.bottom, 70)
    }
    
    var lohabiCellsView: some View {
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
    
    var lohabiEmptyView: some View {
        VStack() {
            Text("It seem like you have not added a 'Lohabi'. Add one by tapping the button below yet")
                .font(.headline)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding()
            Image(systemName: "arrow.down")
                .font(.system(size: 70))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var addFooterView: some View {
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
}

#Preview {
    ContentView()
        .environment(UserDefaultsManager())
}

#Preview("Dutch") {
    ContentView()
        .environment(UserDefaultsManager())
        .environment(\.locale, Locale(identifier: "NL"))
}
