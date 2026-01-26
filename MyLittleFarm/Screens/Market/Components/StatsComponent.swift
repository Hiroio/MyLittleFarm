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
    var body: some View {
        VStack{
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
    }
}

#Preview {
    StatsComponent()
        .environmentObject(StorageManager.shared)
}
