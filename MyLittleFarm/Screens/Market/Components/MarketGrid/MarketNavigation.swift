//
//  MarketNavigation.swift
//  MyLittleFarm
//
//  Created by user on 14.02.2026.
//

import SwiftUI

struct MarketNavigation: View {
    @Binding var currentStat: MarketHeader
    var body: some View {
        HStack(spacing: 10){
            Button{
                    currentStat = .crops
            }label:{
                Image("Field")
                    .scaledToFit()
                    .padding(.vertical, 5)
                    .scaleEffect(currentStat == .crops ? 1.3 : 1)
                    .frame(maxWidth: currentStat == .crops ? .infinity : 50)
                    .background(
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 0, bottomTrailing: 10, topTrailing: 10))
                            .fill(
                        EllipticalGradient(colors: [.clear, .clear, .black.opacity(0.1)])
                            .opacity(0.5)
                            )
                    )
                    .animation(.easeInOut(duration: 0.5), value: currentStat)
            }
            
            Rectangle()
                .frame(width: 1)
                .fixedSize()
            Button{
                    currentStat = .animals
            }label:{
                Image("Barn")
                    .scaledToFit()
                    .padding(.vertical, 5)
                    .frame(maxWidth: currentStat == .animals ? .infinity : 50)
                    .background(
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, bottomLeading: 10, bottomTrailing: 0, topTrailing: 0))
                            .fill(
                        EllipticalGradient(colors: [.clear, .clear, .black.opacity(0.1)])
                            .opacity(0.5)
                            )
                    )
                    .animation(.easeInOut(duration: 0.5), value: currentStat)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: currentStat)
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    MarketNavigation(
        currentStat: .constant(.crops)
    )
}
