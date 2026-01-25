//
//  NavigationBottomBar.swift
//  MyLittleFarm
//
//  Created by user on 25.01.2026.
//

import SwiftUI

struct NavigationBottomBar: View {
    @EnvironmentObject var navManager: NavigationManager
    var body: some View {
        HStack(spacing: 0){
            ForEach(HomeNavigation.allCases){item in
                Button{
                    withAnimation(){
                        navManager.navigationBottomBar = item
                    }
                }label:{
                    Image(item.icon)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(
                            navManager.navigationBottomBar == item ?
                            Color.gray.opacity(0.3) : .white)
                }
            }
        }
    }
}

#Preview {
    NavigationBottomBar()
        .environmentObject(NavigationManager())
}
