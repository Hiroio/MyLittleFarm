//
//  MarketView.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct MarketView: View {
    @EnvironmentObject var storage: StorageManager
    @State private var currentStat: MarketHeader = .crops
    var body: some View {
        VStack(spacing: 15){
//            MARK: - HEADER
            HStack{
                Spacer()
                Text("Market")
                    .fontDesign(.monospaced)
                    .font(.title.bold())
                Image("Market")
                    .scaleEffect(1.3)
                Spacer()
            }
            .padding(5)
//            MARK: - Storage
//            StatsComponent(currentStat: currentStat)
            
//            MARK: - Market Grid
            MarketGrid(currentStat: $currentStat)
                .animation(.linear, value: currentStat)
            
            
        }

    }
}

#Preview {
    MarketView()
        .environmentObject(StorageManager.shared)
    
}
