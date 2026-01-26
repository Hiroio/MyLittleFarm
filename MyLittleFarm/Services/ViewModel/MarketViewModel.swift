//
//  MarketViewModel.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import Foundation


class MarketViewModel {
    
    let storage = StorageManager.shared
    
    
    func sellItem(_ key: CropType) {
        if storage.consume(1, for: key){
            storage.add(key.price, key: .balance)
        }
    }
}
