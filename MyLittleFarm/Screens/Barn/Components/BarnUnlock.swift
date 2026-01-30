//
//  BarnUnlock.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import SwiftUI

struct BarnUnlock: View {
    let unlock: () -> ()
    var body: some View {
        VStack(spacing: 50){
            VStack(spacing: 25){
                Image("Farm")
                    .scaleEffect(1.5)
                Text("The barn needs renovation.")
                    .font(.title2.bold())
            }
            
            Button{
                unlock()
            }label:{
                HStack{
                    Text("Repear 50")
                        .foregroundStyle(.black)
                        .font(.headline)
                    Image("Money")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.green.opacity(0.7))
                )
            }
            
        }
        .fontDesign(.monospaced)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    BarnUnlock(unlock: {})
}
