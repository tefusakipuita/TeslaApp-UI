//
//  InformationView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/23.
//

import SwiftUI

struct InformationView: View {
    
    // MARK: - Property
    
    var imageName: String
    var title: String
    var value: String
//    var isOn: Bool
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: .bottomLeading) {
            // MARK: - Background
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.infoBackground)
                .frame(width: 150, height: 150)
                .shadow(color: .infoShadowTop, radius: 10, x: 7, y: 7)
                .shadow(color: .infoShadowBottom, radius: 10, x: -7, y: -7)
            
            // MARK: - Image
            Image(imageName)
            
            // MARK: - Text
            VStack (alignment: .leading) {
                Text(title)
                    .foregroundColor(.textPrimary)
                Text(value)
                    .foregroundColor(.buttonTintColor)
            } //: VStack
            .padding(12)
            
        } //: ZStack
        .frame(width: 200, height: 200)
    }
}

// MARK: - Preview

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
