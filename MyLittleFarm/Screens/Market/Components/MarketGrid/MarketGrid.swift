//
//  MarketGrid.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct MarketGrid: View {
    @Binding var currentStat: MarketHeader
    @State private var selection = 0
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let products = CropType.allCases
    let animals = AnimalProducts.allCases

    let market = MarketViewModel()

    var body: some View {
            VStack{
                TabView(selection: $currentStat) {
                    FieldGrid()
                        .tag(MarketHeader.crops)
                    AnimalGrid()
                        .tag(MarketHeader.animals)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                MarketNavigation(currentStat: $currentStat)
            }
    }
}


#Preview {
    @Previewable @State var test = MarketHeader.all
    MarketGrid(currentStat: $test)
        .environmentObject(StorageManager.shared)
}
