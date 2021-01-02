//
//  KnobView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/24.
//

import SwiftUI

struct KnobView: View {
    
    // MARK: - Property
    
    let radius: CGFloat
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.knobLinear)
                .frame(width: radius * 2, height: radius * 2)
            
            Circle()
                .fill(Color.blueIndicaor)
                .frame(width: 4, height: 4)
        } //: ZStack
    }
}

// MARK: - Preview

struct KnobView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
