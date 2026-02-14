//
//  FieldGrid.swift
//  MyLittleFarm
//
//  Created by user on 08.02.2026.
//

import SwiftUI

struct FieldGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let products = CropType.allCases
    let market = MarketViewModel()
    var body: some View {
        VStack{
            StatsComponent(currentStat: .crops)
                .clipShape(
                    UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 10, bottomTrailing: 10))
                )
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(products) { item in
                        ProductComponent(
                            name: item.id.capitalized,
                            icon: item.icon,
                            price: item.price,
                            sellItem: {
                                market.sellCrop(item)
                            },
                            sellAllItem: {
                                market.sellAllItems(item)
                            }
                        )
                    }
                }
                .padding()
            }
            .background(.secondary.opacity(0.2))
            .cornerRadius(25)
            .ignoresSafeArea(edges: .bottom)
        }

    }
}

#Preview {
    FieldGrid()
}
