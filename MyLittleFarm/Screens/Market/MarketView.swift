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
            .padding()
            .overlay(alignment: .topLeading){
                HStack{
                    Image(StorageEnums.balance.icon)
                    Text("\(storage.balance)")
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.yellow.opacity(0.4))
                )
                .padding(8)
            }
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
