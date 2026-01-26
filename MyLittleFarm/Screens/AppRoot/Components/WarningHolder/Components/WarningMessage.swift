//
//  WarningMessage.swift
//  MyLittleFarm
//
//  Created by user on 27.01.2026.
//

import SwiftUI

struct WarningMessage: View {
    @EnvironmentObject var navManager: NavigationManager
    @State private var position = 200.0
    let warning: Warning
    var body: some View {
        HStack{
            Text(warning.warning)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .fontDesign(.monospaced)
                .frame(maxWidth: .infinity)
            Spacer()
            Image(warning.icon)
                .resizable()
                .scaledToFit()
                .shadow(radius: 2, x: 8, y: 3)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black.opacity(0.2))
                        .shadow(radius: 5)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 2)
                )
                .padding(5)

                
        }
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(warning.color)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 3)
        )
        .padding(.horizontal)
        .offset(y: position)
        .onAppear{
            animation()
        }
        .transition(.opacity)
    }
    
    func animation(){
        withAnimation(.linear(duration: 0.5)){
            position = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
            withAnimation(.linear(duration: 0.5)){
                position = 200.0
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
            withAnimation{
                navManager.warning = nil
            }
        }
    }
}

#Preview {
    WarningMessage(warning: .field(message: "Not Enough Money!"))
        .environmentObject(NavigationManager())
}
