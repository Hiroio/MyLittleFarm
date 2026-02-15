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
    @Published var animateID: UUID? = nil
    
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
        }else if checkForCapacity(animal: animal){
            navman.warning = .barn(message: "No room for a\nnew chicken!!")
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
    
    func unlockStructure(animal: Animals){
        if storage.balance >= animal.structurePrice{
            storage.add(-animal.structurePrice, key: .balance)
            upgradeHouse(animal: animal)
        }else{
            navman.warning = .barn(message: "Not Enough Money!\n To build this...")
        }
    }
    
    func upgrade(animal: Animals){
        let price = checkBalanceForStructure(balance: storage.balance, animal: animal)
        if price <= storage.balance{
            storage.add(-price, key: .balance)
            upgradeHouse(animal: animal)
        }else{
            navman.warning = .barn(message: "Not Enough Money!")
            return
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
    
    func feedAll(animal: Animals){
        var foodCount: Int = switch animal.food {
        case .hay:
            storage.hay
        case .carrot:
            storage.carrot
        case .grain:
            storage.grain
        }
        if foodCount != 0{
            for i in filter(type: animal){
                if foodCount == 0 { return }
                if let index = barn.firstIndex(where: {$0.id == i.id}){
                    storage.add(-1, for: animal.food)
                    foodCount -= 1
                    barn[index].feed()
                    persist()
                }
            }
        }else{
            navman.warning = .barn(message: "There's no Food!")
        }
    }
    
    func getProduct(id: UUID){
        if let index = barn.firstIndex(where: {$0.id == id}){
            let animal = barn[index].type
            
            if animal == .pig || animal == .horse {
                butch(id: id)
                persist()
            }else{
                let product = barn[index].getProduct()
                storage.add(product, key: barn[index].type.output)
                animateID = id
                persist()
            }
        }else{
            navman.warning = .barn(message: "Opps something went wrong!\nTry again!")
        }
    }
    
    func massiveGetProduct(animal: Animals){
        let animals = filter(type: animal)
        var queue = 0.01
        for i in animals{
            if i.isReadyToGetProduct(now: timer.now){
                if let index = barn.firstIndex(where: {$0.id == i.id}){
                    let product = barn[index].getProduct()
                    storage.add(product, key: barn[index].type.output)
                    DispatchQueue.main.asyncAfter(deadline: .now() + queue){
                        self.animateID = i.id
                    }
                    queue += 0.01
                    persist()
                }
            }
        }
    }
    
    func checkIfAnyReadyToCollect(animal: Animals) -> Bool{
        filter(type: animal).filter({$0.isReadyToGetProduct(now: timer.now)}).count != 0
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
    
    private func upgradeHouse(animal: Animals){
        switch animal {
        case .cow:
            cowShed += 1
        case .chicken:
            chickenCoop += 1
        case .pig:
            pigsty += 1
        case .horse:
            stable += 1
        }
    }
    
    private func checkBalanceForStructure(balance: Int, animal: Animals) -> Int{
        switch animal {
        case .cow:
            cowShed * 15
        case .chicken:
            chickenCoop * 15
        case .pig:
            pigsty * 15
        case .horse:
            stable * 15
        }
    }
    
    private func checkForCapacity(animal: Animals) -> Bool{
        switch animal {
        case .cow:
            self.filter(type: animal).count == cowShed * 5 ? true : false
        case .chicken:
            self.filter(type: animal).count == chickenCoop * 5 ? true : false
        case .pig:
            self.filter(type: animal).count == pigsty * 5 ? true : false
        case .horse:
            self.filter(type: animal).count == stable * 5 ? true : false
        }
    }
    
}

