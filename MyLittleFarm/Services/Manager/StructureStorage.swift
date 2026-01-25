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

    func save(_ fields: [Field]) {
        do {
            let data = try JSONEncoder().encode(fields)
            UserDefaults.standard.set(data, forKey: fieldKey)
        } catch {
            print("Failed to save fields:", error)
        }
    }

    func load() -> [Field] {
        guard let data = UserDefaults.standard.data(forKey: fieldKey) else {
            return [Field()]
        }

        do {
            return try JSONDecoder().decode([Field].self, from: data)
        } catch {
            print("Failed to load fields:", error)
            return [Field()]
        }
    }
}
