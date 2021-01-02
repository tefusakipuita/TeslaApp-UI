//
//  DarkButtonBackground.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/22.
//

import SwiftUI

struct DarkButtonBackground<S: Shape>: View {
    
    // MARK: - Property
    
    var shape: S
    
    var isHighlighted: Bool
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            if isHighlighted {
                // タップ状態
                shape.fill(Color.darkStart)
                    .shadow(color: .darkShadow, radius: 10, x: 7, y: 7)
                    .shadow(color: .lightShadow, radius: 10, x: -7, y: -7)
            } else {
                // デフォルト
                shape.fill(Color.buttonBackground)
                    .shadow(color: .darkShadow, radius: 10, x: 7, y: 7)
                    .shadow(color: .lightShadow, radius: 10, x: -7, y: -7)
            }
        } //: ZStack
    }
}

// MARK: - Preview

struct DarkButtonBackground_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
