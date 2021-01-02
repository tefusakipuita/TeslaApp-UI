//
//  IndicatorView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/24.
//

import SwiftUI

struct IndicatorView: View {
    
    // MARK: - Property
    
    var isOn: Bool
    
    var offsetValue: CGFloat
    
    
    // MARK: - Body
    
    var body: some View {
        Capsule()
            .fill(isOn ? Color.blueIndicaor : Color.sliderIndicator)
            .frame(width: 15, height: 3)
            .offset(x: offsetValue)
    }
}

// MARK: - Preview

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
