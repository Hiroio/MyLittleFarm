//
//  Barn.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import Foundation


struct BarnAnimal: Identifiable, Codable {
    let id: UUID
    let type: Animals

    var date: Date
    var isFed: Bool
    var isProductReady: Date?
    var production: Int
    
    init(id: UUID = UUID(), type: Animals, date: Date = Date(), isFed: Bool = false, isProductReady: Date? = nil, production: Int) {
        self.id = id
        self.type = type
        self.date = date
        self.isFed = isFed
        self.isProductReady = isProductReady
        self.production = production
    }
}
