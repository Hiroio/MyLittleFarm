//
//  NavigationScreen.swift
//  MyLittleFarm
//
//  Created by user on 15.02.2026.
//

import SwiftUI

struct NavigationScreen: View {
    var body: some View {
        ScrollView(){
            VStack{
                ForEach(Array(HomeNavigation.allCases.enumerated()), id: \.offset){index, item in
                    IconButton(item: item)
                        .frame(maxWidth: .infinity, alignment: index % 2 == 0 ? .leading : .trailing)
                }
            }.padding()
        }
        .background(
            ZStack{
                Color(.navigationBackGround)
                Image(.clouds)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
            }
                .ignoresSafeArea()
        )
    }
}

@ViewBuilder
func IconButton(item: HomeNavigation) -> some View{
    VStack(spacing: 0){
        Text(item.id.capitalized)
            .font(.title.bold())
            .monospaced()
        ZStack{
            Image(.backIcon)
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                
            Image(item.icon)
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .padding(25)
                .shadow(radius: 5)
                .shadow(radius: 5)
                .shadow(radius: 5)
        }
        .frame(width: 150, height: 150)
    }
    
    
}

#Preview {
    NavigationScreen()
}
