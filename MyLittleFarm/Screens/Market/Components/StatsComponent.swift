//
//  StatsComponent.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct StatsComponent: View {
    @EnvironmentObject var storage: StorageManager
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let currentStat: MarketHeader
    var body: some View {
        VStack{
            if currentStat == .all || currentStat == .crops{
                LazyVGrid(columns: columns) {
                    ForEach(CropType.allCases){item in
                        var amount: Int{
                            switch item {
                            case .hay: return storage.hay
                            case .carrot: return storage.carrot
                            case .grain: return storage.grain
                            }
                        }
                        HStack{
                            Text("\(amount)")
                            Image(item.icon)
                        }
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.brown.opacity(0.7))
                                .shadow(radius: 5)
                        )
                    }
                }
            }
            
            if currentStat == .animals{
                LazyVGrid(columns: columns) {
                    ForEach(AnimalProducts.allCases){item in
                        HStack{
                            Text("\(amount(of: item))")
                            Image(item.icon)
                                .scaleEffect(item == .egg ? 2.0 : 1.0)
                        }
                        .padding(item == .egg ? 14 : 8)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.brown.opacity(0.7))
                                .shadow(radius: 5)
                        )
                    }
                }
            }
        }
        .animation(.easeInOut, value: currentStat)
    }
    func amount(of animal: AnimalProducts) -> Int{
        switch animal {
        case .milk:
            return storage.milk
        case .egg:
            return storage.egg
        case .chicken:
            return storage.chickenMeat
        case .pork:
            return storage.pork
        case .beef:
            return storage.beef
        case .horse:
            return storage.horse
        }
        
    }
}

#Preview {
    StatsComponent(currentStat: .all)
        .environmentObject(StorageManager.shared)
}
