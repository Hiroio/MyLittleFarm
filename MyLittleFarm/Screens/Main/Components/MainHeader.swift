//
//  MainHeader.swift
//  MyLittleFarm
//
//  Created by user on 23.01.2026.
//

import SwiftUI

struct MainHeader: View {
    @EnvironmentObject var storageManager : StorageManager
    var body: some View {
        HStack{
            HStack{
                Image("Money")
                    .foregroundStyle(.green)
                Text("\(min(9999, storageManager.balance))")
                    .fixedSize()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.yellow.opacity(0.4))
            )
            Spacer()
            ForEach(CropType.allCases){item in
                let value = switch item{
                case .hay: storageManager.hay
                case .carrot: storageManager.carrot
                case .grain: storageManager.grain
                }
                
                HStack(spacing: 0){
                    Image(item.icon)
                        .font(.caption)
                    Text("\(min(999, value))")
                        .padding(.horizontal, 5)
                        .transition(.symbolEffect)
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.black.opacity(0.6))
                )
            }
        }.padding(.horizontal)
    }
}

#Preview {
    MainHeader()
        .environmentObject(StorageManager.shared)
}
