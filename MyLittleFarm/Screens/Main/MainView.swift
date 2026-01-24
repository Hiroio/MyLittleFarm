//
//  MainView.swift
//  MyLittleFarm
//
//  Created by user on 24.01.2026.
//

import SwiftUI

struct MainView: View {
    @StateObject var cropVM: CropViewModel = .init()
    @State private var prepateToPlant: Bool = false

    var body: some View {
        VStack{
            MainHeader()
            
            List(cropVM.fields){ i in
                HStack{
                    if let crop = i.crop{
                        Text(crop.icon)
                    }else{
                        Text("🪏")
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
                            if prepateToPlant{
                                ForEach(CropType.allCases){ item in
                                    Button{
                                        cropVM.plantCrop(id: i.id, crop: item)
                                        prepateToPlant = false
                                    }label:{
                                        Text(item.icon)
                                            .padding(5)
                                            .background(
                                                Circle()
                                                    .fill(.white)
                                                    .shadow(radius: 4)
                                            )
                                    }.buttonStyle(.glass)
                                }
                            }else{
                                Button{
                                    prepateToPlant = true
                                }label:{
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
                }
                .animation(.easeInOut, value: prepateToPlant)
                .animation(.easeInOut, value: i.occupied)
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
            }
            Spacer()
        }
    }
    private func format(_ interval: TimeInterval) -> String {
        let minutes = Int(interval) / 60
        let seconds = Int(interval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    MainView()
        .environmentObject(StorageManager.shared)
}
