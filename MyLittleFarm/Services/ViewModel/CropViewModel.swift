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
    
    private var timer: Timer?
    
    let storage = StructureStorage.shared
    let statStorage = StorageManager.shared
    init() {
        fields = storage.load()
        startTimer()
    }
    
    private func persist() {
        storage.save(fields)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            DispatchQueue.main.async {
                self?.now = Date()
            }
        }
    }

    deinit {
        timer?.invalidate()
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
        if statStorage.balance <= 15 {
//            TODO: Add warning handler
        }else{
            statStorage.add(-15, key: .balance)
            fields.append(Field())
        }
        
        persist()
    }
}


