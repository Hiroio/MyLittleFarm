//
//  TimerManager.swift
//  MyLittleFarm
//
//  Created by user on 28.01.2026.
//

import Foundation
import Combine


@MainActor
final class TimerManager: ObservableObject {
    static let shared = TimerManager()
    
    @Published private(set) var now: Date = Date()
    
    private var timer: Timer?

    private init() {
        start()
    }

    private func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            DispatchQueue.main.async {
                self?.now = Date()
            }
        }
    }

    deinit {
        timer?.invalidate()
    }
}
