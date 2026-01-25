//
//  UITimer.swift
//  MyLittleFarm
//
//  Created by user on 24.01.2026.
//

import SwiftUI

struct UITimer: View {
    let progres: Double
    var body: some View {
        ZStack{
            
            
            Circle()
                .trim(from: 0.0, to: progres)
                .stroke(.yellow, lineWidth: 3)
                .fixedSize()
            Circle()
                .stroke(.yellow.opacity(0.2), lineWidth: 4)
                .fixedSize()

                
        }
        .animation(.easeInOut, value: progres)
    }
}

#Preview {
    UITimer(progres: 0.1)
}
