//
//  MyLittleFarmApp.swift
//  MyLittleFarm
//
//  Created by user on 23.01.2026.
//

import SwiftUI

@main
struct MyLittleFarmApp: App {
    @StateObject var navManager: NavigationManager = .init()
    @StateObject var cropVM: CropViewModel = .init()
    @StateObject var storageManager: StorageManager = .shared
    var body: some Scene {
        WindowGroup {
            AppRoot()
        }
        .environmentObject(cropVM)
        .environmentObject(storageManager)
        .environmentObject(navManager)
    }
}
