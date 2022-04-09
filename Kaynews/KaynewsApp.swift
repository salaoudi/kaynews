//
//  KaynewsApp.swift
//  Kaynews
//
//  Created by Zayn on 4/8/22.
//

import SwiftUI

@main
struct KaynewsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(StorageManager.shared)
        }
    }
}
