//
//  BarnMenu.swift
//  MyLittleFarm
//
//  Created by user on 27.01.2026.
//

import SwiftUI

struct BarnMenu: View {
    var body: some View {
        VStack{
            HStack{
                Image("Barn")
                Text("Barn")
                    .font(.title.bold())
                Image("Barn")
            }
            AnimalSelection()
                .padding(.vertical)
            
            AnimalsMenu()
            
        }
    }
}

#Preview {
    BarnMenu()
        .environmentObject(BarnViewModel())
        .environmentObject(TimerManager.shared)
}
