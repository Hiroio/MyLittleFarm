//
//  AnimalsEnum.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import Foundation


enum Animals: String, Identifiable, CaseIterable, Codable {
    case cow, chicken, pig, horse
    
    var id: String {
        self.rawValue
    }
    
    var prices: Int{
        switch self {
        case .cow:
            25
        case .chicken:
            15
        case .pig:
            20
        case .horse:
            30
        }
    }
    
    var icon: String{
        self.rawValue.capitalized
    }
    
    var production: Int{
        switch self {
        case .cow:
            return Int.random(in: 20...30)
        case .chicken:
            return Int.random(in: 15...25)
        case .pig:
            return 10
        case .horse:
            return 1
        }
    }
    
}


