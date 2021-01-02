//
//  ContentView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/22.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // MARK: - Background
                Color.backgroundColor
                
                // MARK: - Home
                HomeView()
            } //: ZStack
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
