//
//  LohabiApp.swift
//  Lohabi
//
//  Created by Stefan de Gier on 27/12/2023.
//

import SwiftUI
import SwiftData

@main
struct LohabiApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            //Onboarding.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(UserDefaultsManager())
                .environmentObject(LocationManager())

        }
        .modelContainer(sharedModelContainer)
    }
}
