//
//  AnimalGrid.swift
//  MyLittleFarm
//
//  Created by user on 08.02.2026.
//

import SwiftUI

struct AnimalGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let animals = AnimalProducts.allCases
    let market = MarketViewModel()
    var body: some View {
        VStack{
            StatsComponent(currentStat: .animals)
            ScrollView(){
                LazyVGrid(columns: columns) {
                    ForEach(AnimalProducts.allCases) { animal in
                        ProductComponent(
                            name: animal.id.capitalized,
                            icon: animal.icon,
                            price: animal.price,
                            sellItem:{ market.sellAnimal(animal)
                            },
                            sellAllItem:{ market.sellAllAnimals(animal)
                            })
                    }
                }
                .padding()
            }
            .background(.secondary.opacity(0.2))
            .cornerRadius(25)
        }
    }
}

#Preview {
    AnimalGrid()
}
