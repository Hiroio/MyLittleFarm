//
//  TopNavBar.swift
//  MyLittleFarm
//
//  Created by user on 14.02.2026.
//

import SwiftUI

struct TopNavBar: View {
    @EnvironmentObject var navManager: NavigationManager
    var body: some View {
        HStack(spacing: 0){
            let sections = Array(HomeNavigation.allCases.enumerated())
            ForEach(sections, id: \.offset){index, item in
                Button{
                    navManager.navigationBottomBar = item
                }label:{
                    Image(item.icon)
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity)
                        .opacity(navManager.navigationBottomBar == item ? 1 : 0.5)
                        .shadow(radius: 1, x: 4, y: -3)
                        .overlay(
                            Group{
                                if navManager.navigationBottomBar == item {
                                    EllipticalGradient(colors: [.clear, .clear, .black.opacity(0.1)])
                                }
                            }
                        )
                }
            }
            .animation(.easeInOut, value: navManager.navigationBottomBar)
        }
        
        .background(
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, topTrailing: 15))
                .fill(.background)
                
        )
        .clipShape(
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, topTrailing: 15))
        )
    }
}

#Preview {
    TopNavBar()
        .environmentObject(NavigationManager.shared)
}
