//
//  UserDefaultsManager.swift
//  Lohabi
//
//  Created by Stefan de Gier on 02/01/2024.
//

import Foundation

class UserDefaultsManager: ObservableObject {
    private let needsOnboardingKey = "needsOnboarding"
    
    @Published var needsOnboarding: Bool {
        didSet {
            UserDefaults.standard.set(needsOnboarding, forKey: needsOnboardingKey)
        }
    }
    
    init() {
        needsOnboarding = UserDefaults.standard.bool(forKey: needsOnboardingKey)
    }
}