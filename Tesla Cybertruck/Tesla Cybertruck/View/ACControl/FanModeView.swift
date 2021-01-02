//
//  FanModeView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/25.
//

import SwiftUI

struct FanModeView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager = ACModeManager()
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // MARK: - Title
            Text("Mode")
                .foregroundColor(.textPrimary)
                .font(.system(size: 24, weight: .bold))
            
            HStack (spacing: 20) {
                ForEach(manager.modeData) { mode in
                    ModeTabView(mode: mode)
                        .onTapGesture(perform: {
                            manager.selectMode(index: mode.id)
                        })
                }
            } //: HStack
            .padding(.top, 10)
        } //: VStack
    }
}

// MARK: - Preview

struct FanModeView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
