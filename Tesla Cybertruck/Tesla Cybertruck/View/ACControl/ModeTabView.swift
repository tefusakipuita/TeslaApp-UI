//
//  ModeTabView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/25.
//

import SwiftUI

struct ModeTabView: View {
    
    // MARK: - Property
    
    var mode: ACMode
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (spacing: 14) {
            Text(mode.title)
                .foregroundColor(.buttonTintColor)
                .font(.system(size: 16, weight: .regular))
            
            Image(mode.imageName)
                .renderingMode(.template)
                .foregroundColor(mode.selected ? .white : .gray)
                .frame(width: 28, height: 28)
                .padding(22)
                .background(
                    ACModeBackground(shape: Circle(), isHighlighted: mode.selected)
                )
        } //: VStack
    }
}

// MARK: - Preview

struct ModeTabView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
