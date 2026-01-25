//
//  AppRoot.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct AppRoot: View {
    @EnvironmentObject var navManager: NavigationManager
    var body: some View {
        VStack{
            switch navManager.navigationBottomBar {
            case .market:
                MarketView()
            case .fields:
                MainView()
            case .farm:
                EmptyView()
            }
            NavigationBottomBar()
                
        }.ignoresSafeArea(edges: .bottom)
        
    }
}

#Preview {
    AppRoot()
        .environmentObject(CropViewModel())
        .environmentObject(StorageManager.shared)
        .environmentObject(NavigationManager())
}
