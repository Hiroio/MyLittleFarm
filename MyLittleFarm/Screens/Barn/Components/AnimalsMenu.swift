//
//  AnimalsMenu.swift
//  MyLittleFarm
//
//  Created by user on 27.01.2026.
//

import SwiftUI

struct AnimalsMenu: View {
    @EnvironmentObject var barnVM: BarnViewModel
    var body: some View {
        ScrollView(){
            AnimalCard(animal: .chicken, barn: barnVM.filter(type: .chicken), structureLVL: barnVM.chickenCoop)
            AnimalCard(animal: .pig, barn: barnVM.filter(type: .pig), structureLVL: barnVM.pigsty)
            AnimalCard(animal: .cow, barn: barnVM.filter(type: .cow), structureLVL: barnVM.cowShed)
            AnimalCard(animal: .horse, barn: barnVM.filter(type: .horse), structureLVL: barnVM.stable)
        }
        .padding(5)
    }
}

#Preview {
    AnimalsMenu()
        .environmentObject(BarnViewModel())
}
