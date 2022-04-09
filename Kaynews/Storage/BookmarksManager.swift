//
//  Bookmarks.swift
//  Kaynews
//
//  Created by Zayn on 4/8/22.
//

import Foundation
import Combine

//Making class avaliable, so it can be used in other views
class StorageManager: ObservableObject {
	static let shared = StorageManager()
	private init(){}
	@UserDefualtsStorage("BookmarkedMovies", defaultValue: [])
	var BookmarkedMovies: [News] {
		willSet {
			//watches for a press, sends it to bookmarks view
			objectWillChange.send()
		}
	}
}

//Stores Movies For Offline Use in Userdefualts.
//SETTING UP A GENERIC TYPE TO STORE MOVIE TO BOOKMARKS
@propertyWrapper
public struct UserDefualtsStorage<T: Codable> {
	let key: String
	let defaultValue: T
	
	init(_ key: String, defaultValue: T) {
		self.key = key
		self.defaultValue = defaultValue
	}
	
	public var wrappedValue: T {
		get {
			if let data = UserDefaults.standard.data(forKey: key) {
				if let decodedData = try? JSONDecoder().decode(T.self, from: data) {
					return decodedData
				}
			}
			return self.defaultValue
			
		}
		set {
			if let encodedData = try? JSONEncoder().encode(newValue) {
				UserDefaults.standard.set(encodedData, forKey: key)
			}
		}
	}
	
	
}
