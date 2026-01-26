//
//  MarketGrid.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct MarketGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    private var products = CropType.allCases
    
    let market = MarketViewModel()
    var body: some View {
        ScrollView(){
            LazyVGrid(columns: columns) {
                ForEach(products){item in
                    VStack{
                        Image(item.icon)
                            .scaleEffect(1.5)
                            .padding()
                        Text(item.id)
                            .font(.headline)
                        HStack(spacing: 10){
                            Text("\(item.price)")
                            Image("Money")
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.brown.opacity(0.3))
                        )
                        Button{
                            market.sellItem(item)
                        }label:{
                            Text("Sell")
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.green.opacity(9.6))
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
            .fontDesign(.monospaced)
            .padding()
        }
        
    }
}

#Preview {
    MarketGrid()
}
