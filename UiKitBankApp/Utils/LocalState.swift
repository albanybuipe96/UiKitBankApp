//
//  LocalState.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 24/05/2023.
//

import Foundation

public class LocalState {
    
    private enum Keys: String {
        case hasOnboarded
    }
    
    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
//            UserDefaults.standard.synchronize()
        }
    }
}
