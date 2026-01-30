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
                    
                    Text("\(numberOfAnimals)/\(15 * structureLVL)")
                        .bold()
                    Spacer()
                    
                    Button{
//                        TODO: UPGRADE
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
                    VStack(spacing: 20){
                        Text(animal.id.capitalized)
                            .bold()
                        Image(animal.icon)
                            .scaleEffect(2.0)
                        Button{
                            if numberOfAnimals > 0{
                                
                            }else{
                                
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
                    }
                    .frame(height: 120)
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
                    .frame(height: 150)
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
        .frame(height: 200)
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
