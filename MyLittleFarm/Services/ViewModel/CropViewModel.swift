//
//  CropViewModel.swift
//  MyLittleFarm
//
//  Created by user on 24.01.2026.
//

import Foundation
import Combine


@MainActor
final class CropViewModel: ObservableObject {

    @Published var fields: [Field] = []
    @Published var now: Date = Date()
    @Published var animateID: UUID? = nil
    @Published var lastAmount: String = ""
    
    
    let storage = StructureStorage.shared
    let statStorage = StorageManager.shared
    let timer = TimerManager.shared
    let navManager = NavigationManager.shared
    
    private var cancellables = Set<AnyCancellable>()
    init() {
        fields = storage.load(true)
        
        timer.$now
            .sink { [weak self] now in
                self?.handleTick(now)
            }
            .store(in: &cancellables)
    }
    
    private func persist() {
        storage.save(fields, true)
    }
    


    func plantCrop(id: UUID, crop: CropType) {
        if let index = fields.firstIndex(where: { $0.id == id}) {
            fields[index].plant(crop)
        }
        
        
        persist()
    }
    
    func harvestCrop(id: UUID) {
        if let index = fields.firstIndex(where: { $0.id == id}) {
            if let amount = fields[index].harvest(){
                lastAmount = "+\(amount)"
                animateID = id
            }else{
                animateID = id
                lastAmount = "Failure"
            }
        }
        
        
        persist()
    }
    
    func addField() {
        if statStorage.balance < 15 {
            navManager.warning = .field(message: "Not enough Money!")
        }else{
            statStorage.add(-15, key: .balance)
            fields.append(Field())
        }
        
        persist()
    }
    
    private func handleTick(_ now: Date) {
        objectWillChange.send()
    }
}


