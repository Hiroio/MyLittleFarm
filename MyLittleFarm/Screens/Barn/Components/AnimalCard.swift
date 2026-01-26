//
//  AnimalCard.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import SwiftUI

struct AnimalCard: View {
    var body: some View {
        HStack(spacing: 45){
            VStack{
                Pricing(15)
                Image("Chicken")
                    .scaleEffect(2)
                    .shadow(radius: 1, x: 5, y: 5)
                
            }
            VStack{
                Pricing(25)
                Image("Cow")
                    .scaleEffect(2)
                    .shadow(radius: 1, x: 5, y: 5)
            }
            
            VStack{
                Pricing(20)
                Image("Pig")
                    .scaleEffect(2)
                    .shadow(radius: 1, x: 5, y: 5)
            }
            
            VStack{
                Pricing(30)
                Image("Horse")
                    .scaleEffect(2)
                    .shadow(radius: 1, x: 5, y: 5)
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
    AnimalCard()
}
