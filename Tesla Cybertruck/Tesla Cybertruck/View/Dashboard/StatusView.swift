//
//  StatusView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/23.
//

import SwiftUI

struct StatusView: View {
    
    // MARK: - Property
    
    var imageName: String
    var title: String
    var value: String
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack (spacing: 6) {
                Image(imageName)
                    .renderingMode(.template)
                    .foregroundColor(.textPrimary)
                
                Text(title)
                    .foregroundColor(.buttonTintColor)
                    .font(.system(size: 18, weight: .regular))
            } //: HStack
            
            Text(value)
                .foregroundColor(.textPrimary)
                .padding(.leading, 18)
        } //: VStack
    }
}

// MARK: - Preview

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
