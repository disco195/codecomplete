//
//  Database.swift
//  CodeComplete
//
//  Copyright © 2020 Vijay Sharma. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class Database {
	static let `default` = Database()
	private lazy var keystore = KeychainWrapper.standard
	
	var fullScreen: Bool {
		get {
			if let fs = keystore.bool(forKey: "fullScreen") {
				return fs
			}
			
			return UIScreen.main.traitCollection.horizontalSizeClass == .compact
		}
		set {
			keystore.set(newValue, forKey: "fullScreen")
		}
	}
	
	var onboarding: Bool {
		get {
			if let onboarding = keystore.bool(forKey: "onboarding") {
				return onboarding
			}
			
			return false
		}
		set {
			keystore.set(newValue, forKey: "onboarding")
		}
	}
	
	func set(solution: String, name: String, index: Int) {
		let clean = name.lowercased().replacingOccurrences(of: " ", with: "-")
		keystore.set(solution, forKey: "solution-\(clean)-\(index)")
	}
	
	func solution(name: String, index: Int) -> String? {
		let clean = name.lowercased().replacingOccurrences(of: " ", with: "-")
		return keystore.string(forKey: "solution-\(clean)-\(index)")
	}
	
	func set(state: String, name: String) {
		let clean = name.lowercased().replacingOccurrences(of: " ", with: "-")
		keystore.set(state, forKey: "state-\(clean)")
	}
	
	func state(name: String) -> String? {
		let clean = name.lowercased().replacingOccurrences(of: " ", with: "-")
		return keystore.string(forKey: "state-\(clean)")
	}
}
