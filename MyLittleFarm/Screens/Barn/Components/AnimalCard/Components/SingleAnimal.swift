//
//  SingleAnimal.swift
//  MyLittleFarm
//
//  Created by user on 28.01.2026.
//

import SwiftUI

struct SingleAnimal: View {
    @EnvironmentObject var barnVM: BarnViewModel
    @EnvironmentObject var timer: TimerManager
    let item: BarnAnimal
    let animal: Animals
    
    var body: some View {
        HStack(spacing: 0){
            Image(animal.icon)
            Text("\(item.production)")
                .font(.caption)
            Image(animal.productionIcon)
                .scaleEffect(1.3)
            
            if item.production == 0 {
                Button{
                    barnVM.butch(id: item.id)
                }label:{
                    Text("Butch")
                        .foregroundStyle(.white)
                        .padding(7)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.red)
                        )
                }
            }
            if item.isFed{
                if item.isReadyToGetProduct(now: timer.now){
                    Spacer()
                    Button{
                        barnVM.getProduct(id: item.id)
                    }label: {
                        Text(animal == .pig ? "Butch" : "Colect")
                            .foregroundStyle(animal == .pig ? .white : .black)
                            .padding(7)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(animal == .pig ? .red : .yellow)
                            )
                    }
                }else{
                    
                    AnimalProgressLine(progress: (Double(item.timeRemaining(now: timer.now)) / Double(animal.productionTime)))
                        .padding()
                    
                    Text("\(Int(item.timeRemaining(now: timer.now)))s")
                        .font(.caption.bold())
                }
                
            }else{
                Spacer()
                Button{
                    barnVM.feed(id: item.id)
                }label: {
                    Text("Feed")
                        .font(.caption)
                        .foregroundStyle(.black)
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.yellow)
                        )
                    
                }
                .padding(.horizontal, 5)
                Text("\(animal.consuming)x")
                Image(animal.food.icon)
                    .scaleEffect(0.8)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SingleAnimal(item: BarnAnimal(type: .chicken, production: 15), animal: .chicken)
        .environmentObject(BarnViewModel())
        .environmentObject(TimerManager.shared)
}
