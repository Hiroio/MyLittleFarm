//
//  AnimalProducts.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import Foundation

enum AnimalProducts: String, Identifiable, CaseIterable, Codable {
    case milk, egg, chicken, pork, beef, horse
    
    var id: String{
        self.rawValue
    }
    
    var storageKey: String{
        switch self {
        case .milk:
            return "Animal.Product.Milk"
        case .egg:
            return "Animal.Product.Egg"
        case .chicken:
            return "Animal.Product.Chicken"
        case .pork:
            return "Animal.Product.Pork"
        case .beef:
            return "Animal.Product.Beef"
        case .horse:
            return "Animal.Product.Horse"
        }
    }
    
    var icon: String{
        switch self {
        case .chicken:
            "ChickenMeat"
        default:
            self.rawValue.capitalized
        }
    }
}
