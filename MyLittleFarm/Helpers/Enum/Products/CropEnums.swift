//
//  Enums.swift
//  MyLittleFarm
//
//  Created by user on 23.01.2026.
//

import Foundation

enum CropType: String, Identifiable, CaseIterable, Codable {
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
        self.rawValue.capitalized
    }
    
    var price: Int{
        switch self{
        case .hay: 2
        case .carrot: 2
        case .grain: 1
        }
    }
}



