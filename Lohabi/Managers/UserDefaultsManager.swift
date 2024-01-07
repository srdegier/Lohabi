//
//  UserDefaultsManager.swift
//  Lohabi
//
//  Created by Stefan de Gier on 02/01/2024.
//

import Foundation
import Observation

@Observable
class UserDefaultsManager {
    
    private let needsOnboardingKey = "needsOnboarding"
    
    var needsOnboarding: Bool {
        didSet {
            UserDefaults.standard.set(needsOnboarding, forKey: needsOnboardingKey)
        }
    }
        
    init() {
        UserDefaults.standard.register(defaults: [needsOnboardingKey: true])
        needsOnboarding = UserDefaults.standard.bool(forKey: needsOnboardingKey)
    }
    
    private func printAllKeys() {
        let userDefaults = UserDefaults.standard
        let allEntries = userDefaults.dictionaryRepresentation()
        
        for key in allEntries.keys {
            print(key)
        }
    }
}
