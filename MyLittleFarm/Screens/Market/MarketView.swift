//
//  MarketView.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct MarketView: View {
    var body: some View {
        VStack{
//            MARK: - HEADER
            HStack{
                Spacer()
                Text("Market")
                    .fontDesign(.monospaced)
                    .font(.title2.bold())
                Image("Market")
                Spacer()
            }
//            MARK: - Storage
            
            
//            MARK: - Market Grid
            MarketGrid()
            
            
        }
    }
}

#Preview {
    MarketView()
}
