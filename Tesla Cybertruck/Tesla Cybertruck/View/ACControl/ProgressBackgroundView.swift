//
//  ProgressBackgroundView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/23.
//

import SwiftUI

struct ProgressBackgroundView: View {
    
    // MARK: - Property
    
    let radius: CGFloat
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.sliderBackgroundEnd)
                .frame(width: radius * 2, height: radius * 2)
                .scaleEffect(1.3)
                .shadow(color: .sliderTopShadow, radius: 30, x: -20, y: -20)
                .shadow(color: .sliderBottomShadow, radius: 30, x: 20, y: 20)
            
            Circle()
                .stroke(Color.sliderInnerBackground, lineWidth: 55)
                .frame(width: radius * 2, height: radius * 2)
        } //: ZStack
    }
}

// MARK: - Preview

struct ProgressBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
