//
//  DashboardView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/22.
//

import SwiftUI

struct DashboardView: View {
    
    // MARK: - Property
    
    @Environment(\.presentationMode) var presentation
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            Color.backgroundColor
            
            VStack {
                
                // MARK: - Top Button
                HStack {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Image("menu")
                    })
                    .buttonStyle(DarkButtonStyle())
                    
                    Spacer()
                    
                    VStack {
                        Text("Tesla")
                            .font(.system(size: 18))
                            .foregroundColor(.buttonTintColor)
                        Text("Cybertruck")
                            .font(.system(size: 18, weight: .black))
                            .foregroundColor(.textPrimary)
                    } //: VStack
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image("profile")
                    })
                    .buttonStyle(DarkButtonStyle())
                } //: HStack
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.horizontal, 20)
                
                // MARK: - Car Image
                Image("cyber_tuck_4")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding(.top, 40)
                    .padding(.bottom, -12)
                
                // MARK: - Status
                HStack {
                    VStack (alignment: .leading, spacing: 24) {
                        Text("Status")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 24, weight: .bold))
                        
                        HStack (spacing: 30) {
                            StatusView(imageName: "battery", title: "Battery", value: "54%")
                            StatusView(imageName: "range", title: "Range", value: "297km")
                            StatusView(imageName: "temerature", title: "Temperature", value: "27℃")
                        } //: HStack
                    } //: VStack
                    
                    Spacer()
                } //: HStack
                .padding(.bottom, 30)
                .padding(.leading, 30)
                
                // MARK: - Information
                HStack {
                    VStack (alignment: .leading, spacing: 24) {
                        Text("Information")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 24, weight: .bold))
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: -16) {
                                InformationView(imageName: "circle", title: "Engine", value: "Sleeping mode")
                                InformationView(imageName: "rectangle", title: "Climate", value: "A/C is on")
                                InformationView(imageName: "triangle_1", title: "Tire", value: "Low pressure")
                            } //: HStack
                        } //: Scroll
                        .offset(x: -25, y: -25)
                    } //: VStack
                    
                    Spacer()
                } //: HStack
                .padding(.leading, 30)
                
                // MARK: - Navigation
                HStack {
                    Text("Navigation")
                        .foregroundColor(.textPrimary)
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                    
                    Text("History")
                        .foregroundColor(.buttonTintColor)
                        .font(.system(size: 18, weight: .regular))
                } //: HStack
                .padding(.horizontal, 16)
                .padding(.top, -15)
                
                Spacer()
            } //: VStack
            
            // MARK: - AC
            VStack {
                Spacer()
                
                ACControlView()
            } //: VStack
            
        } //: ZStack
        .ignoresSafeArea()
    }
}

// MARK: - Property

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
