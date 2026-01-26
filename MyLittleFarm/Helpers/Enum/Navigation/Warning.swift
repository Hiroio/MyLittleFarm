//
//  Warning.swift
//  MyLittleFarm
//
//  Created by user on 27.01.2026.
//

import Foundation
import SwiftUI


enum Warning: Equatable{
    case field(message: String), barn(message: String), market(message: String), system(message: String)
    
    var icon: String{
        switch self {
        case .field(_):
            return "FieldWarning"
        case .barn(_):
            return "BarnWarning"
        case .market(_):
            return "MarketWarning"
        case .system(_):
            return "SystemWarning"
        
        }
    }
    
    var color: Color{
        switch self {
        case .field(_):
            return Color.brown.mix(with: .black, by: 0.1)
        case .barn(_):
            return Color.red.mix(with: .brown, by: 0.4)
        case .market(_):
            return Color.green.mix(with: .brown, by: 0.4)
        case .system(_):
            return Color.yellow.mix(with: .red, by: 0.2)
        
        }
    }
    
    var warning: String{
        switch self {
        case .field(message: let msg):
            return msg
        case .barn(message: let msg):
            return msg
        case .market(message: let msg):
            return msg
        case .system(message: let msg):
            return msg
        }
    }
    

    
}
