//
//  AnimalProgressLine.swift
//  MyLittleFarm
//
//  Created by user on 28.01.2026.
//

import SwiftUI

struct AnimalProgressLine: View {
    let progress: Double
    var body: some View {
        ZStack{
            GeometryReader{ geo in
                RoundedRectangle(cornerRadius: 10)
                    .fill(.green)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray)
                    .frame(width: geo.size.width * progress)
            }
        }
        .clipShape(.rect(cornerRadius: 10))
        .animation(.easeInOut, value: progress)
    }
}

#Preview {
    AnimalProgressLine(progress: 0.2)
}
