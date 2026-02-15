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
    var lastAmount: Int = 0
    
    init(id: UUID = UUID(), type: Animals, date: Date = Date(), isFed: Bool = false, isProductReady: Date? = nil, production: Int) {
        self.id = id
        self.type = type
        self.date = date
        self.isFed = isFed
        self.isProductReady = isProductReady
        self.production = production
    }
    
    
    mutating func feed(){
        var interval = 0
        
        switch type {
        case .cow:
            interval = Cow.eat()
        case .chicken:
            interval = Chicken.eat()
        case .pig:
            interval = Pig.eat()
        case .horse:
            interval = Horse.eat()
        }
        
        isFed = true
        isProductReady = Calendar.current.date(byAdding: .second, value: interval, to: Date())
    }
    
    mutating func getProduct() -> Int{
        isFed = false
        isProductReady = nil
        
        
        switch type{
        case .pig, .horse:
            lastAmount = 1
            production -= 1
            return 1
        default:
            if production == 1{
                lastAmount = 1
                production = 0
                return 1
            }else{
                let random = Int.random(in: 1...2)
                production -= random
                lastAmount = random
                return random
            }
        }
    }
    
    mutating func getMeat() -> Int{
        switch type {
        case .cow:
            5
        case .chicken:
            1
        case .pig:
            15
        case .horse:
            1
        }
    }
}



extension BarnAnimal{
    func isReadyToGetProduct(now: Date) -> Bool {
        guard isFed, let fedAt = isProductReady else { return false }
        return now >= fedAt
    }
    
    func timeRemaining(now: Date) -> TimeInterval {
        guard isFed, let isProductReady else { return 0 }
        return max(0, isProductReady.timeIntervalSince(now))
    }
}
