//
//  StorageManager.swift
//  MyLittleFarm
//
//  Created by user on 23.01.2026.
//

import Foundation
import Combine

@MainActor
final class StorageManager: ObservableObject {

    static let shared = StorageManager()

    @Published private(set) var hay: Int = 0
    @Published private(set) var carrot: Int = 0
    @Published private(set) var grain: Int = 0

    private init() {
        load()
    }

    // MARK: - Public API

    func add(_ amount: Int, for crop: CropType) {
        switch crop {
        case .hay:
            hay += amount
            save(hay, key: .hay)
        case .carrot:
            carrot += amount
            save(carrot, key: .carrot)
        case .grain:
            grain += amount
            save(grain, key: .grain)
        }
    }

    func consume(_ amount: Int, for crop: CropType) -> Bool {
        switch crop {
        case .hay:
            guard hay >= amount else { return false }
            hay -= amount
            save(hay, key: .hay)
        case .carrot:
            guard carrot >= amount else { return false }
            carrot -= amount
            save(carrot, key: .carrot)
        case .grain:
            guard grain >= amount else { return false }
            grain -= amount
            save(grain, key: .grain)
        }
        return true
    }

    // MARK: - Private

    private func load() {
        hay = UserDefaults.standard.integer(forKey: CropType.hay.storageKey)
        carrot = UserDefaults.standard.integer(forKey: CropType.carrot.storageKey)
        grain = UserDefaults.standard.integer(forKey: CropType.grain.storageKey)
    }

    private func save(_ value: Int, key: CropType) {
        UserDefaults.standard.set(value, forKey: key.storageKey)
    }
}
