//
//  ListOfFields.swift
//  MyLittleFarm
//
//  Created by user on 24.01.2026.
//

import SwiftUI

struct ListOfFields: View {
    @EnvironmentObject var cropVM: CropViewModel
    
    let  i: Field
    @State private var prepateToPlant: Bool = false
    var body: some View {
        HStack{
            HStack{
                if let crop = i.crop{
                    Image(crop.icon)
                }else{
                    Image("Field")
                }
                Text("Field")
                
                
                Spacer()
                
                //                    MARK: - Monitoring for time to harvest
                Group{
                    if i.occupied {
                        if let remaining = i.timeRemaining(now: cropVM.now) {
                            if i.isReadyToHarvest(now: cropVM.now) {
                                Button{
                                    cropVM.harvestCrop(id: i.id)
                                }label:{
                                    Text("Ready to harvest!")
                                        .underline(true)
                                        .foregroundColor(.green)
                                }
                            } else {
                                Text(" \(format(remaining))")
                                UITimer(progres: Double(remaining / 15))
                                    .scaleEffect(1.7)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                
                
                //                    MARK: monitoring for occupation
                Circle()
                    .fill(i.occupied ? .red : .green)
                    .fixedSize()
                
                
                //                    MARK: Simple plant
                if !(i.occupied){
                    Harvest(isPresented: $prepateToPlant,
                            plant: { crop in cropVM.plantCrop(id: i.id, crop: crop) }
                    )
                    
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .shadow(radius: 3)
            )
            .overlay(alignment: .leading){
                Group{
                    if i.id == cropVM.animateID{
                        AmountAnimation(amount: cropVM.lastAmount)
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                                    cropVM.animateID = nil
                                }
                            }
                    }
                }
            }
            
            if prepateToPlant {
                ForEach(CropType.allCases) { item in
                    HStack{
                        Button {
                            cropVM.plantCrop(id: i.id, crop: item)
                            prepateToPlant = false
                        } label: {
                            Image(item.icon)
                                .padding(8)
                                .background(
                                    Circle()
                                        .fill(.white)
                                        .shadow(radius: 4)
                                )
                        }
                    }
                    .padding(10)
                }
                
            }
            
            
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.brown.opacity(0.8))
        )
        .animation(.easeInOut, value: prepateToPlant)
        .animation(.easeInOut, value: i.occupied)
        
    }
    
    private func format(_ interval: TimeInterval) -> String {
        let minutes = Int(interval) / 60
        let seconds = Int(interval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
        
    }
}


// MARK: - Plant View
@ViewBuilder
func Harvest(
    isPresented: Binding<Bool>,
    plant: @escaping (CropType) -> ()
) -> some View {
    if isPresented.wrappedValue {
//        ForEach(CropType.allCases) { item in
//            Button {
//                plant(item)
//                isPresented.wrappedValue = false
//            } label: {
//                Text(item.icon)
//                    .padding(5)
//                    .background(
//                        Circle()
//                            .fill(.white)
//                            .shadow(radius: 4)
//                    )
//            }
//            .buttonStyle(.glass)
//        }
        
    } else {
        Button {
            isPresented.wrappedValue = true
        } label: {
            Text("Plant")
                .foregroundStyle(.white)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.green)
                )
        }
    }
}


#Preview {
    ListOfFields(i: Field())
        .environmentObject(CropViewModel())
}
