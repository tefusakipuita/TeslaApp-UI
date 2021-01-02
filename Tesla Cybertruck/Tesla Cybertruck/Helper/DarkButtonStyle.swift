//
//  DarkButtonStyle.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/22.
//

import SwiftUI


// MARK: - ButtonStyle のカスタマイズ, 形とか色とかを決めれる
struct DarkButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.buttonTintColor)
            .frame(width: 56, height: 56)
            .contentShape(Circle())
            .background(
                // configuration.isPressed でボタンがデフォルト状態かタップ状態かのBool値を返せる
                DarkButtonBackground(shape: Circle(), isHighlighted: configuration.isPressed)
            )
    }
}
