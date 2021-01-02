//
//  ProgressIndicatorView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/25.
//

import SwiftUI

struct ProgressIndicatorView: View {
    
    // MARK: - Property
    
    @Binding var progress: CGFloat
    
    var totalValue: CGFloat
    
    var indicatorCount = 8
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            ForEach(Array(stride(from: 0, to: indicatorCount, by: 1)), id: \.self) { i in
                IndicatorView(isOn: progress >= CGFloat(i) * totalValue / CGFloat(indicatorCount), offsetValue: 160)
                    .rotationEffect(Angle(degrees: Double(i * 360 / indicatorCount)))
            }
        } //: ZStack
    }
}

// MARK: - Preview

struct ProgressIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
