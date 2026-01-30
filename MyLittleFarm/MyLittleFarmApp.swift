//
//  MyLittleFarmApp.swift
//  MyLittleFarm
//
//  Created by user on 23.01.2026.
//

import SwiftUI

@main
struct MyLittleFarmApp: App {
    @StateObject var navManager: NavigationManager = .shared
    @StateObject var cropVM: CropViewModel = .init()
    @StateObject var storageManager: StorageManager = .shared
    @StateObject var timer: TimerManager = .shared
    @AppStorage("FirstLaunch") var firstLaunch: Bool = true
    var body: some Scene {
        WindowGroup {
            AppRoot()
                .onAppear {
                    if firstLaunch{
                        storageManager.add(15, key: .balance)
                        firstLaunch = false
                    }
                }
        }
        .environmentObject(cropVM)
        .environmentObject(storageManager)
        .environmentObject(navManager)
        .environmentObject(timer)
    }
}
