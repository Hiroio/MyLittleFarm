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

//    MARK: Money
    @Published private(set) var balance: Int = 0
    
//    MARK: Crops
    @Published private(set) var hay: Int = 0
    @Published private(set) var carrot: Int = 0
    @Published private(set) var grain: Int = 0

//    TODO: Animals
    
    
    
//    TODO: Structures
    @Published private(set) var fields: Int = 0
    private init() {
        load()
    }

    // MARK: - Public API

    func add(_ amount: Int, for crop: CropType) {
        switch crop {
        case .hay:
            hay += amount
            save(hay, key: crop.storageKey)
        case .carrot:
            carrot += amount
            save(carrot, key: crop.storageKey)
        case .grain:
            grain += amount
            save(grain, key: crop.storageKey)
        }
    }
    
    func add(_ amount: Int, key: StorageEnums) {
            switch key {
            case .animals:
                break
            case .fields:
                fields += amount
                save(fields, key: key.storageKey)
            case .balance:
                balance += amount
                save(balance, key: key.storageKey)
        }
    }
    
    func consume(_ amount: Int, for crop: CropType) -> Bool {
        switch crop {
        case .hay:
            guard hay >= amount else { return false }
            hay -= amount
            save(hay, key: crop.storageKey)
        case .carrot:
            guard carrot >= amount else { return false }
            carrot -= amount
            save(carrot, key: crop.storageKey)
        case .grain:
            guard grain >= amount else { return false }
            grain -= amount
            save(grain, key: crop.storageKey)
        }
        return true
    }

    // MARK: - Private

    private func load() {
        hay = UserDefaults.standard.integer(forKey: CropType.hay.storageKey)
        carrot = UserDefaults.standard.integer(forKey: CropType.carrot.storageKey)
        grain = UserDefaults.standard.integer(forKey: CropType.grain.storageKey)
        balance = UserDefaults.standard.integer(forKey: StorageEnums.balance.storageKey)
    }

    private func save(_ value: Int, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    
}
