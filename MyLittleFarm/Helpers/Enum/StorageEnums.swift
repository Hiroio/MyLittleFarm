//
//  StorageEnums.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import Foundation


enum StorageEnums: String, CaseIterable{
    case fields, balance, animals
    
    var storageKey: String {
        self.rawValue.capitalized
    }
    
    var icon: String {
        switch self {
        case .balance:
            return "Money"
        default:
            return self.rawValue.capitalized
        }
        
    }
}
