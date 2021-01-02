//
//  CustomToggleStyle.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/22.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    
    var diameter: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            // On の時は
            Circle()
                .fill(configuration.isOn ? Color.blueButtonBackground : Color.buttonSelectedReverseBackground)
                .overlay(
                    Circle()
                        .stroke(configuration.isOn ? Color.blueButtonBorder : Color.buttonSelectedBackground, lineWidth: 4)
                )
                .shadow(color: .black, radius: 40, x: 10, y: 15)
                .shadow(color: .darkStart, radius: 40, x: -10, y: -15)
                .frame(width: diameter, height: diameter)
            
            configuration.label
                .foregroundColor(.white)
            
        } //: ZStack
        .onTapGesture(perform: {
            configuration.isOn.toggle()
        })
    }
}
