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
    @State private var collectAnimation: Bool = false
    
    var body: some View {
        HStack(spacing: 0){
            Image(animal.icon)
            Text("\(item.production)")
                .font(.caption)
                .overlay(
                    Group{
                        if collectAnimation{
                            AmountAnimation(amount: "\(item.lastAmount)")
                                .onAppear{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                        withAnimation(.easeInOut(duration: 0.5)){
                                            collectAnimation = false
                                        }
                                    }
                                }
                        }
                        }
                )
            if animal == .chicken || animal == .cow{
                Image(animal.productionIcon)
                    .scaleEffect(animal == .chicken ? 1.3 : 0.5)
            }

            if item.isFed{
                if item.isReadyToGetProduct(now: timer.now){
//                    MARK: IF READY TO Collect BTN to Colect or kill
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
//                    MARK: Progress line of collection
                    AnimalProgressLine(progress: (Double(item.timeRemaining(now: timer.now)) / Double(animal.productionTime)))
                        .padding()
                    
                    Text("\(Int(item.timeRemaining(now: timer.now)))s")
                        .font(.caption.bold())
                }
                
            }else{
//                MARK: Feed Animal
                Spacer()
                if item.production == 0 {
    //                    MARK: If no products left BTN to kill
                    Button{
                        barnVM.butch(id: item.id)
                    }label:{
                        Text("Butch")
                            .font(.caption)
                            .foregroundStyle(.white)
                            .padding(7)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.red)
                            )
                    }
                }else{
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
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onChange(of: barnVM.animateID) { oldValue, newValue in
            if newValue == item.id{
                collectAnimation = true
            }
        }
    }
}

#Preview {
    SingleAnimal(item: BarnAnimal(type: .chicken, production: 15), animal: .chicken)
        .environmentObject(BarnViewModel())
        .environmentObject(TimerManager.shared)
}
