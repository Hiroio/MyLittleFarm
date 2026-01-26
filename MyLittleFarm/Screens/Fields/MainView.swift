//
//  MainView.swift
//  MyLittleFarm
//
//  Created by user on 24.01.2026.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var cropVM: CropViewModel

    var body: some View {
        VStack(spacing: 15){
            MainHeader()
            HStack{
                Text("^[\(cropVM.fields.count) Field](inflect: true)")
                    .font(.title2.bold())

                Spacer()
                
                
                    Button{
                        withAnimation(){
                            cropVM.addField()
                        }
                    }label: {
                        VStack{
                        Text("+")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.brown)
                            )
                        Text("15 🔅")
                                .foregroundStyle(.yellow)
                            .font(.caption)
                    }

                }
            }
            .padding()
            VStack{
                List(cropVM.fields){ i in
                    ListOfFields(i: i)
                    
                }
                .listRowSpacing(0)
                .listStyle(.plain)
            }
            Spacer()
        }
        .fontDesign(.monospaced)
        .environmentObject(cropVM)
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
        .environmentObject(CropViewModel())
}
