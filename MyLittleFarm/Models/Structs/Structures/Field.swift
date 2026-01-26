//
//  Field.swift
//  MyLittleFarm
//
//  Created by user on 23.01.2026.
//

import Foundation


struct Field: Identifiable, Codable {
    let id: UUID
    private(set) var occupied: Bool = false
    private(set) var crop: CropType? = nil
    private(set) var plantedAt: Date? = nil
    
    
    init(
        id: UUID = UUID(),
        occupied: Bool = false,
        crop: CropType? = nil,
        plantedAt: Date? = nil
    ) {
        self.id = id
        self.occupied = occupied
        self.crop = crop
        self.plantedAt = plantedAt
    }
    
//    MARK: if ready to harvest
    var readyToHarvest: Bool {
        guard occupied, let plantedAt else {
            return false
        }
        
        let timeInterval: TimeInterval = 15
        let isPastDueDate = Date().timeIntervalSince(plantedAt) >= timeInterval
        
        return isPastDueDate
    }
    
    mutating func plant(_ crop: CropType) {
        guard !occupied else {
            print("Field is already occupied")
            return
        }

        self.crop = crop
        self.plantedAt = Date()
        self.occupied = true

        print("Planted \(crop)")
    }

    mutating func harvest() -> Int? {
        guard readyToHarvest, let crop else {
            print("Nothing to harvest")
            return nil
        }
        
        let amount = Int.random(in: 2...4)
        
        StorageManager.shared.add(amount, for: crop)
        self.crop = nil
        self.plantedAt = nil
        self.occupied = false

        print("Harvested \(amount) of \(crop)")

        return amount
    }
}


extension Field{
    static let growDuration: TimeInterval = 15

    func isReadyToHarvest(now: Date) -> Bool {
        guard occupied, let plantedAt else { return false }
        return now.timeIntervalSince(plantedAt) >= Self.growDuration
    }

    func timeRemaining(now: Date) -> TimeInterval? {
        guard occupied, let plantedAt else { return nil }
        let endDate = plantedAt.addingTimeInterval(Self.growDuration)
        return max(0, endDate.timeIntervalSince(now))
    }
}
