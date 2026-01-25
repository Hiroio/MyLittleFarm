//
//  NavigationManager.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import Foundation
import Combine


class NavigationManager: ObservableObject {
    
    @Published var navigationBottomBar: HomeNavigation = .fields
}
