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
        ZStack{
            VStack{
                VStack{
                    switch navManager.navigationBottomBar {
                    case .market:
                        MarketView()
                    case .fields:
                        MainView()
                    case .barn:
                        BarnView()
                    }
                }
                .frame(maxHeight: .infinity)
                NavigationBottomBar()
                
            }.ignoresSafeArea(edges: .bottom)
            
            WarningHolder()
        }
    }
}

#Preview {
    AppRoot()
        .environmentObject(CropViewModel())
        .environmentObject(StorageManager.shared)
        .environmentObject(NavigationManager())
}
