//
//  AnimalCard.swift
//  MyLittleFarm
//
//  Created by user on 27.01.2026.
//

import SwiftUI

struct AnimalCard: View {
    @EnvironmentObject var barnVM: BarnViewModel
    let animal: Animals
    let barn: [BarnAnimal]
    let structureLVL: Int
    var body: some View {
        let numberOfAnimals: Int = barn.count
        
        VStack{
            
            if structureLVL > 0{
                
                
                HStack{
                    Image("Barn")
                    Text(animal.structure)
                    
                    Text("\(numberOfAnimals)/\(5 * structureLVL)")
                        .bold()
                    Spacer()
                    
                    Button{
                        barnVM.upgrade(animal: animal)
                    }label: {
                        Text("Upgrade")
                            .padding(7)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.green)
                            )
                    }
                }
                
                
                HStack{
                    VStack(spacing: 15){
                        Text(animal.id.capitalized)
                            .bold()
                        Image(animal.icon)
                            .scaleEffect(2.0)
                        VStack{
                            Button{
                                if numberOfAnimals > 0{
                                    barnVM.feedAll(animal: animal)
                                }else{
                                    barnVM.addAnimal(animal: animal)
                                }
                            }label: {
                                Text(numberOfAnimals > 0 ? "Feed all" : "Buy one")
                                    .foregroundStyle(.black)
                                    .padding(7)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(numberOfAnimals > 0 ? .yellow : .green)
                                    )
                                
                            }
                            
                            let readyToCollect = !barnVM.checkIfAnyReadyToCollect(animal: animal)
                            Button{
                                barnVM.massiveGetProduct(animal: animal)
                            }label: {
                                Text("Collect all")
                                    .foregroundStyle(.black)
                                    .padding(7)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(.green)
                                    )
                            }
                            .disabled(readyToCollect)
                            .opacity(readyToCollect ? 0.4 : 1)
                        }
                    }
                    .frame(height: 150)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(style: StrokeStyle(lineWidth: 2))
                    )
                    Spacer()
                    ScrollView{
                        VStack(alignment: .leading){
                            ForEach(barn){item in
                                SingleAnimal(item: item, animal: item.type)
                            }
                        }
                        
                    }
                    .padding(7)
                    .frame(height: 170)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(style: StrokeStyle(lineWidth: 2))
                )
                }else{
                    VStack{
                        HStack{
                            Image("Barn")
                            Image(animal.icon)
                                .scaleEffect(1.5)
                        }
                        Text(animal.structure)
                        
                        Button{
                            barnVM.unlockStructure(animal: animal)
                        }label:{
                            Text("Unlock \(animal.structurePrice)")
                                .bold()
                                .foregroundStyle(.black)
                            Image("Money")
                        }
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.yellow)
                        )
                    }
                }
        }
        .fontDesign(.monospaced)
        .frame(maxWidth: .infinity)
        .frame(height: 220)
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(style: StrokeStyle(lineWidth: 2))
        )
    }
}

#Preview {
    AnimalCard(animal: .chicken, barn: [BarnAnimal(type: .chicken, production: 15), BarnAnimal(type: .chicken, production: 15), BarnAnimal(type: .chicken, production: 15), BarnAnimal(type: .chicken, production: 15), BarnAnimal(type: .chicken, production: 15)], structureLVL: 1)
        .environmentObject(BarnViewModel())
}
