//
//  AmountAnimation.swift
//  MyLittleFarm
//
//  Created by user on 24.01.2026.
//

import SwiftUI

struct AmountAnimation: View {
    let amount: String
    @State private var animate: Bool = false
    var body: some View {
        ZStack{
            Text(amount)
                .foregroundStyle(.yellow)
                .bold()
                .offset(x: 0, y: animate ? -200 : 0)
                .opacity(animate ? 0 : 1)
                .scaleEffect(animate ? 1.5 : 1.0)
                .animation(.easeInOut(duration: 4.0), value: animate)
            
        }
        .onAppear(){
            animate = true
        }
    }
}

#Preview {
    AmountAnimation(amount: "3")
}
