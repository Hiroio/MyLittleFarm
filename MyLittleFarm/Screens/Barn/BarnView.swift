//
//  BarnView.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import SwiftUI

struct BarnView: View {
    @StateObject var barnVM: BarnViewModel = .init()
    @AppStorage("Game.Barn.Unlock") var isUnlocked: Bool = false
    var body: some View {
        if isUnlocked{
            
        }else{
            BarnUnlock(unlock: barnVM.unlock)
        }
    }
}

#Preview {
    BarnView()
}
