//
//  ACModeManager.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/25.
//

import SwiftUI

class ACModeManager: ObservableObject {
    
    @Published var modeData = Data.modeData
    
    @Published var selectedIndex = -1
    
    func selectMode(index: Int) {
        // まだ選択されていないボタンをタップした時に、新しく選択したボタンをtrueに
        if selectedIndex != index {
            modeData[index].selected = true
            
            // 最初のタップの際以外は、選択していたボタンをfalseに戻す
            if selectedIndex != -1 {
                modeData[selectedIndex].selected = false
            }
            
            // selectedIndex を index に
            selectedIndex = index
        }
    }
}
