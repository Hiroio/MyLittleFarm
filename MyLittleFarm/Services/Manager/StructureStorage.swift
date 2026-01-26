//
//  StructureStorage.swift
//  MyLittleFarm
//
//  Created by user on 24.01.2026.
//

import Foundation


@MainActor
final class StructureStorage {

    static let shared = StructureStorage()

    private let fieldKey = "Game.Fields"
    private let barnKey = "Game.Animals"

    func save<T: Codable>(_ array: [T],_ key: Bool) {
        do {
            let data = try JSONEncoder().encode(array)
            UserDefaults.standard.set(data, forKey: key ? fieldKey : barnKey)
        } catch {
            print("Failed to save fields:", error)
        }
    }

    func load<T: Codable>(_ key: Bool) -> [T] {
        guard let data = UserDefaults.standard.data(forKey: key ? fieldKey: barnKey) else {
            return []
        }

        do {
            return try JSONDecoder().decode([T].self, from: data)
        } catch {
            print("Failed to load fields:", error)
            return []
        }
    }
}
