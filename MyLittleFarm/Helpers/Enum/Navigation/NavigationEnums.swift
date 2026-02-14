//
//  NavigationEnums.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import Foundation

enum HomeNavigation: String, CaseIterable, Identifiable{
    case market, fields, barn
    
    var id: String{
        self.rawValue
    }
    
    var icon: String{
        self.rawValue.capitalized
    }
}

enum MarketHeader: Hashable{
    case all, crops, animals
}
