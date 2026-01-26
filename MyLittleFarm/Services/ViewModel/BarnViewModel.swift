//
//  BarnViewModel.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import Foundation
import Combine


class BarnViewModel: ObservableObject {
    
    @Published var barn: [BarnAnimal] = []

    let storage = StorageManager.shared
    let structureStorage = StructureStorage.shared
    
    let navman = NavigationManager.shared
    
    init(){
        barn = structureStorage.load(false)
    }
    
    func persist(){
        structureStorage.save(barn, false)
    }
    
    
    func addAnimal(animal: Animals) {
        if storage.balance <= animal.prices {
            return
        }else{
            let newAnimal = BarnAnimal(
                type: animal,
                production: animal.production
            )
            storage.add(-animal.prices, key: .balance)
            
            barn.append(newAnimal)
            
            persist()
        }
        
    }
    
    func unlock(){
        if storage.balance <= 50{
            navman.warning = .barn(message: "Not Enough Money!")
            return
        }else{
            storage.add(-50, key: .balance)
            UserDefaults.standard.set(true, forKey: "Game.Barn.Unlock")
        }
    }
}

