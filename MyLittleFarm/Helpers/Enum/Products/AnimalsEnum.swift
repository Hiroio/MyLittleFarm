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
    
    var structurePrice: Int{
        switch self {
        case .cow:
            40
        case .chicken:
            20
        case .pig:
            30
        case .horse:
            50
        }
    }
    
    var structure: String{
        switch self {
        case .cow:
            "Cowshed"
        case .chicken:
            "Сhicken coop"
        case .pig:
            "Pigsty"
        case .horse:
            "Stable"
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
    
    var productionIcon: String {
        switch self {
        case .cow:
            AnimalProducts.milk.icon
        case .chicken:
            AnimalProducts.egg.icon
        case .pig:
            AnimalProducts.pork.icon
        case .horse:
            AnimalProducts.horse.icon
        }
    }
    
    var food: CropType{
        switch self {
        case .cow:
                .hay
        case .chicken:
                .grain
        case .pig:
                .carrot
        case .horse:
                .carrot
        }
    }
    
    var output: AnimalProducts{
        switch self {
        case .cow:
                .milk
        case .chicken:
                .egg
        case .pig:
                .pork
        case .horse:
                .horse
        }
    }
    
    var meatOutput: AnimalProducts{
        switch self {
        case .cow:
                .beef
        case .chicken:
                .chicken
        case .pig:
                .pork
        case .horse:
                .horse
        }
    }
    
    var consuming: Int{
        switch self {
        case .cow:
            2
        case .chicken:
            1
        case .pig:
            3
        case .horse:
            5
        }
    }
    
    var productionTime: Int{
        switch self {
        case .cow:
            60
        case .chicken:
            30
        case .pig:
            60*3
        case .horse:
            60*5
        }
    }
    
}


