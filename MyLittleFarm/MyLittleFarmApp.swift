//
//  MyLittleFarmApp.swift
//  MyLittleFarm
//
//  Created by user on 23.01.2026.
//

import SwiftUI

@main
struct MyLittleFarmApp: App {
    @StateObject var storageManager: StorageManager = .shared
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(storageManager)
    }
}
