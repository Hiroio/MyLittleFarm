//
//  Enums.swift
//  MyLittleFarm
//
//  Created by user on 23.01.2026.
//

import Foundation

enum CropType: String, Identifiable, CaseIterable {
    case hay
    case carrot
    case grain
    
    var id: String{
        self.rawValue.capitalized
    }
    
    var storageKey: String{
        switch self{
            case .hay: "AnimalFeed.hay"
            case .carrot: "AnimalFeed.carrot"
            case .grain: "AnimalFeed.grain"
        }
    }
    
    var icon: String{
        switch self {
        case .hay:
            "🫔"
        case .carrot:
            "🥕"
        case .grain:
            "🌾"
        }
    }
}

extension CropType {
    func makeFeed() -> AnimalFeed {
        switch self {
        case .hay: return Hay()
        case .carrot: return Carrot()
        case .grain: return Grain()
        }
    }
}
