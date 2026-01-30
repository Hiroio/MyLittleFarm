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
    let userDefault = UserDefaults.standard
    let timer = TimerManager.shared
    
    var cancellables = Set<AnyCancellable>()
    init(){
        barn = structureStorage.load(false)
        
        timer.$now
            .sink { [weak self] now in
                self?.handleTick(now)
            }
            .store(in: &cancellables)
        
    }
    
    func persist(){
        structureStorage.save(barn, false)
    }
    
    
    func addAnimal(animal: Animals) {
        if storage.balance <= animal.prices {
            navman.warning = .barn(message: "Not enough Money!")
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
            chickenCoop += 1
            barn.append(BarnAnimal(type: .chicken, production: 20))
            UserDefaults.standard.set(true, forKey: "Game.Barn.Unlock")
            persist()
        }
    }
    
    func filter(type: Animals) -> [BarnAnimal]{
        return barn.filter({$0.type == type})
    }
    
    
    func feed(id: UUID){
        if let index = barn.firstIndex(where: {$0.id == id}){
            let animal = barn[index].type
            
            let access: Bool = switch animal.food {
            case .hay:
                storage.hay > animal.consuming
            case .carrot:
                storage.carrot > animal.consuming
            case .grain:
                storage.grain > animal.consuming
            }
            
            if access{
                storage.add(-animal.consuming, for: animal.food)
                barn[index].feed()
                persist()
            }else{
                navman.warning = .barn(message: "Not enough Food!")
            }
        }else{
            navman.warning = .barn(message: "Opps something went wrong!\nTry again!")
        }
    }
    
    func getProduct(id: UUID){
        if let index = barn.firstIndex(where: {$0.id == id}){
            let animal = barn[index].type
            
            if animal == .pig || animal == .horse {
                butch(id: id)
            }else{
                let product = barn[index].getProduct()
                storage.add(product, key: barn[index].type.output)
                persist()
            }
        }else{
            navman.warning = .barn(message: "Opps something went wrong!\nTry again!")
        }
    }
    
    func butch(id: UUID){
        if let index = barn.firstIndex(where: {$0.id == id}){
            let product = barn[index].getMeat()
            storage.add(product, key: barn[index].type.meatOutput)
            barn.remove(at: index)
            persist()
        }else{
            navman.warning = .barn(message: "Opps something went wrong!\nTry again!")
        }
    }
    
    private func handleTick(_ now: Date) {
        objectWillChange.send()
    }
}
    
    
    
    
extension BarnViewModel{
//    MARK: Storage Default
    var chickenCoop: Int{
        get{
            return userDefault.integer(forKey: "Game.Barn.Chicken.Coop")
        }
        set{
            userDefault.set(newValue, forKey: "Game.Barn.Chicken.Coop")
        }
    }
    var cowShed: Int{
        get{
            return userDefault.integer(forKey: "Game.Barn.CowShed")
        }
        set{
            userDefault.set(newValue, forKey: "Game.Barn.CowShed")
        }
    }
    var pigsty: Int{
        get{
            return userDefault.integer(forKey: "Game.Barn.Pigsty")
        }
        set{
            userDefault.set(newValue, forKey: "Game.Barn.Pigsty")
        }
    }
    var stable: Int{
        get{
            return userDefault.integer(forKey: "Game.Barn.Stable")
        }
        set{
            userDefault.set(newValue, forKey: "Game.Barn.Stable")
        }
    }
}

