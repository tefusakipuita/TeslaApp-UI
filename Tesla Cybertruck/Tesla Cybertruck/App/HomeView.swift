//
//  WelcomeView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/22.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    @State var toggleOn = true
    
    @State var selection: Int? = nil
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // MARK: - Top Right Button
            HStack {
                Spacer()
                
                NavigationLink(
                    destination: DashboardView()
                        .navigationBarHidden(true),
                    tag: 1,
                    selection: $selection,
                    label: {
                        Button(action: {
                            // 画面遷移用
                            selection = 1
                        }, label: {
                            Image(systemName: "gearshape")
                        })
                        // 自作したButtonStyleを適用
                        .buttonStyle(DarkButtonStyle())
                    }) //: NavLink
            } //: HStack
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.trailing, 20)
            
            // MARK: - Top Title
            Group {
                Text("Tesla")
                    .font(.system(size: 24))
                    .foregroundColor(.buttonTintColor)
                Text("Cybertruck")
                    .font(.system(size: 45, weight: .black))
                    .foregroundColor(.textPrimary)
            } //: Group
            
            ZStack {
                
                // MARK: - Speed Text
                HStack (alignment: .top) {
                    Text("297")
                        .font(.system(size: 170, weight: .ultraLight))
                    Text("km")
                        .font(.system(size: 24, weight: .medium))
                        .offset(y: 30)
                } //: HStack
                .foregroundColor(.textPrimary)
                
                // MARK: - Car Image
                Image("cyber_truck")
                    .resizable()
                    .scaledToFit()
                    .offset(y: 130)
            } //: ZStack
            .offset(y: -20)
            
            Spacer()
            
            // MARK: - Bottom Text & ToggleButton
            Group {
                Text("A/C is turned on")
                    .font(.system(size: 24))
                    .foregroundColor(.buttonTintColor)
                    .padding(.bottom, -4)
                
                Toggle(isOn: $toggleOn, label: {
                    Image("lock")
                        .renderingMode(.template)
                })
                .toggleStyle(CustomToggleStyle(diameter: 140))
                
                Text(toggleOn ? "Car is open" : "Tap to open the car")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.textPrimary)
                    .padding(.top, -22)
            } //: Group
            .padding(.bottom, 24)
            
        } //: VStack
    }
}

// MARK: - Preview

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
