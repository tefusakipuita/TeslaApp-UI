//
//  FanSliderView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/25.
//

import SwiftUI

struct FanSliderView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (spacing: 8) {
            
            // MARK: - Title
            Text("Fan Speed")
                .foregroundColor(.textPrimary)
                .font(.system(size: 24, weight: .bold))
            
            GeometryReader(content: { geometry in
                FanSlider(width: geometry.size.width)
            })
            .frame(height: 50)
        } //: VStack
    }
}

// MARK: - Preview

struct FanSliderView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
