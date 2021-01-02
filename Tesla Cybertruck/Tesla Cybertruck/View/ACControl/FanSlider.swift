//
//  FanSlider.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/25.
//

import SwiftUI

struct FanSlider: View {
    
    // MARK: - Property
    
    @State var progress: CGFloat = 0
    
    @State var knobPosition: CGFloat = 0
    
    var width: CGFloat
    var knobRadius: CGFloat = 14
    
    var config = FanSliderConfig()
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // MARK: - Number
            HStack {
                ForEach(1...5, id: \.self) { i in
                    Text("\(i)")
                        .foregroundColor(.buttonTintColor)
                        .font(.system(size: 18, weight: .regular))
                    
                    if i != 5 {
                        Spacer()
                    }
                } //: ForEach
            } //: HStack
            
            ZStack (alignment: .leading) {
                
                // MARK: - Slider
                Capsule()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.sliderTopShadow]), startPoint: .top, endPoint: .bottom)
                    )
                    .frame(height: 9)
                
                // MARK: - Progress Blue Slider
                Capsule()
                    .fill(Color.blueIndicaor)
                    .frame(width: knobPosition, height: 5)
                
                // MARK: - Knob
                KnobView(radius: knobRadius)
                    .offset(x: knobPosition)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged({ value in
                                onChanged(xLocation: value.location.x)
                            })
                            .onEnded({ value in
                                onEnded(xLocation: value.location.x)
                            })
                    ) //: gesture
                    .onAppear(perform: {
                        sliderInitialize()
                    })
                
            } //: ZStack
            
        } //: VStack
    }
    
    
    // MARK: - Function
    
    func sliderInitialize() {
//        progress = config.minimumValue
//
//        knobPosition = (progress * width) - knobPosition
        
        knobPosition = -knobRadius
    }
    
    func onChanged(xLocation: CGFloat) {
        let tempProgress = xLocation / width
        
        if tempProgress >= 0 && tempProgress <= 1 {
            progress = (tempProgress * (config.maximumValue - config.minimumValue)) + config.minimumValue
            
            knobPosition = (tempProgress * width) - knobRadius
        }
    }
    
    func onEnded(xLocation: CGFloat) {
        let tempProgress = xLocation / width
        
        if tempProgress >= 0 && tempProgress <= 1 {
            // 1 ~ 5  (rounded() で四捨五入)
            let roundedProgress = ((tempProgress * (config.maximumValue - config.minimumValue)) + config.minimumValue).rounded()
            
            let updatedTempProgress = (roundedProgress - config.minimumValue) / (config.maximumValue - config.minimumValue)
            
            withAnimation(.spring()) {
                knobPosition = (updatedTempProgress * width) - knobRadius
            }
        }
    }
}

// MARK: - Preview

struct FanSlider_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
