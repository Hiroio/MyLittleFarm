//
//  NavigationManager.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import Foundation
import Combine


class NavigationManager: ObservableObject {
    static let shared = NavigationManager()
    
    @Published var navigationBottomBar: HomeNavigation = .fields
    
    @Published var warning: Warning? = nil
}
