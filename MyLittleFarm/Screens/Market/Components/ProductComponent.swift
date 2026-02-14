//
//  ProductComponent.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct ProductComponent: View {
    let name: String
    let icon: String
    let price: Int
    let sellItem: () -> ()
    let sellAllItem: () -> ()
    var body: some View {
        VStack{
            Image(icon)
                .scaleEffect(1.5)
                .padding()
            Text(name)
                .font(.headline)
            HStack(spacing: 10){
                Text("\(price)")
                Image("Money")
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.brown.opacity(0.3))
            )
            Button{
                sellItem()
            }label:{
                Text("Sell")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(7)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.green.opacity(0.8))
                    )
            }
            Button{
                sellAllItem()
            }label:{
                Text("Sell All")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(7)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.orange.opacity(0.8))
                    )
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .shadow(radius: 5)
        )
    }
}

#Preview {
    ProductComponent(name: "", icon: "", price: 2, sellItem: {}, sellAllItem: {})
}
