//
//  MarketView.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct MarketView: View {
    @EnvironmentObject var storage: StorageManager
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
            StatsComponent()
            
//            MARK: - Market Grid
            MarketGrid()
            
            
        }
    }
}

#Preview {
    MarketView()
        .environmentObject(StorageManager.shared)
    
}
