//
//  DarkButtonBackground.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/22.
//

import SwiftUI

struct ACModeBackground<S: Shape>: View {
    
    // MARK: - Property
    
    var shape: S
    
    var isHighlighted: Bool
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            if isHighlighted {
                // タップ状態
                shape.fill(Color.blueButtonBackground)
                    .overlay(
                        shape.stroke(Color.blueButtonBorder, lineWidth: 2)
                    )
                    .shadow(color: .black, radius: 10, x: 7, y: 7)
                    .shadow(color: .darkStart, radius: 10, x: -7, y: -7)
            } else {
                // デフォルト
                shape.fill(Color.buttonBackground)
                    .overlay(
                        shape.stroke(Color.buttonSelectedEnd, lineWidth: 2)
                    )
                    .shadow(color: .black, radius: 10, x: 7, y: 7)
                    .shadow(color: .darkStart, radius: 10, x: -7, y: -7)
            }
        } //: ZStack
    }
}

// MARK: - Preview

struct ACModeBackground_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
