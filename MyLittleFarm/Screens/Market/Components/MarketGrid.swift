//
//  MarketGrid.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct MarketGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    private var products = CropType.allCases + CropType.allCases
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
                        Button{}label:{
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
