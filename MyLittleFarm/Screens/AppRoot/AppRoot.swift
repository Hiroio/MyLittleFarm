//
//  AppRoot.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct AppRoot: View {
    @EnvironmentObject var storageManager: StorageManager
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .topLeading){
                    HStack{
                        Image("Money")
                            .foregroundStyle(.green)
                        Text("\(min(9999, storageManager.balance))")
                            .fixedSize()
                    }
                    .padding(7)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.yellow.opacity(0.4))
                            .shadow(radius: 2, x: 4, y: 3)
                    )
                    .padding(.horizontal)
                }
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
