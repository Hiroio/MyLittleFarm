//
//  MarketViewModel.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import Foundation


class MarketViewModel {
    
    let storage = StorageManager.shared
    let navManager = NavigationManager.shared
    
    func sellCrop(_ key: CropType) {
        if storage.consume(1, for: key){
            storage.add(key.price, key: .balance)
        }else{
            navManager.warning = .market(message: "You've got an empty pockets\nGet out of here!")
        }
    }
    
    
    
    func sellAllItems(_ key: CropType) {
        var count = 0
        switch key {
        case .hay:
            count = storage.hay
        case .carrot:
            count = storage.carrot
        case .grain:
            count = storage.grain
        }
        
        if count == 0{
            navManager.warning = .market(message: "You've got an empty pockets\nGet out of here!")
        }else{
            storage.add(-count, for: key)
            storage.add(key.price * count, key: .balance)
        }
    }
}


extension MarketViewModel{
    func sellAnimal(_ key: AnimalProducts) {
        if storage.consumeAnimal(1, for: key){
            storage.add(key.price, key: .balance)
        }else{
            navManager.warning = .market(message: "You've got an empty pockets\nGet out of here!")
        }
    }
    
    func sellAllAnimals(_ key: AnimalProducts){
        var count = 0
        switch key {
        case .milk:
            count = storage.milk
        case .egg:
            count = storage.egg
        case .chicken:
            count = storage.chickenMeat
        case .pork:
            count = storage.pork
        case .beef:
            count = storage.beef
        case .horse:
            count = storage.horse
        }
        if count == 0 {
            navManager.warning = .market(message: "You've got an empty pockets\nGet out of here!")
        }else{
            storage.add(-count, key: key)
            storage.add(key.price * count, key: .balance)
        }
    }
}
