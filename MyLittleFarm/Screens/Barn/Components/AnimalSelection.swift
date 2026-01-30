//
//  AnimalCard.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import SwiftUI

struct AnimalSelection: View {
    @EnvironmentObject var barnVM: BarnViewModel
    var body: some View {
        HStack(spacing: 45){
            ForEach(Animals.allCases.sorted(by: {$0.prices < $1.prices})){item in
                Button{
                    barnVM.addAnimal(animal: item)
                }label: {
                    VStack{
                        Pricing(item.prices)
                            .foregroundStyle(.brown)
                            .bold()
                        Image(item.icon)
                            .scaleEffect(2)
                            .shadow(radius: 1, x: 5, y: 5)
                    }
                }
            }
        }
    }
}

@ViewBuilder
func Pricing(_ price: Int) -> some View {
    HStack(spacing: 0){
        Text("\(price)")
        Image("Money")
    }
}

#Preview {
    AnimalSelection()
        .environmentObject(BarnViewModel())
}
