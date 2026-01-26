//
//  WarningHolder.swift
//  MyLittleFarm
//
//  Created by user on 26.01.2026.
//

import SwiftUI

struct WarningHolder: View {
    @EnvironmentObject var navManager: NavigationManager
    var body: some View {
        VStack{
            Spacer()
            switch navManager.warning {
            case .field(let message):
                WarningMessage(warning: .field(message: message))
            case .barn(let message):
                WarningMessage(warning: .barn(message: message))
            case .market(let message):
                WarningMessage(warning: .market(message: message))
            case .system(let message):
                WarningMessage(warning: .system(message: message))
            default:
                EmptyView()
            }
        }
        .animation(.linear, value: navManager.warning)
    }
}

#Preview {
    WarningHolder()
        .environmentObject(NavigationManager())
}
