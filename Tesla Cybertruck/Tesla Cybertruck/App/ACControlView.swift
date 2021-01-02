//
//  ACControlView.swift
//  Tesla Cybertruck
//
//  Created by 中筋淳朗 on 2020/11/23.
//

import SwiftUI

struct ACControlView: View {
    
    // MARK: - Property
    
    @State var barHeight: CGFloat = 650
    let swipeBarHeight: CGFloat = 650
    
    let radius: CGFloat = 110
    let knobRadius: CGFloat = 20
    let strokeWidth: CGFloat = 40
    
    @State var progress: CGFloat = 15
//    @State var angleValue: CGFloat = 0
    let config = CircularProgressConfig(minimumValue: 0, maximumValue: 40, totalValue: 40)
    
    @State var toggleOn = true
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.backgroundColor)
                // 外枠用
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.backgroundBorderColor, lineWidth: 2)
                )
            
            VStack {
                
                // MARK: - Top Bar
                Capsule()
                    .fill(Color.sliderIndicator)
                    .frame(width: 60, height: 4)
                    .padding(.top, 16)
                
                
                // MARK: - Top Text & Button
                HStack {
                    VStack (alignment: .leading, spacing: 8) {
                        Text(toggleOn ? "A/C is ON" : "A/C is OFF")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 24, weight: .bold))
                        Text(toggleOn ? "Tap to turn off or swipe up \n for a fast setup" : "Tap to turn on or swipe up \n for a fast setup")
                            .foregroundColor(.buttonTintColor)
                            .font(.system(size: 18, weight: .regular))
                            .fixedSize()
                    } //: VStack
                    
                    Spacer()
                    
                    Toggle(isOn: $toggleOn, label: {
                        Image("power")
                    })
                    .toggleStyle(CustomToggleStyle(diameter: 70))
                } //: HStack
                
                
                // MARK: - Circlar
                ZStack {
                    ProgressBackgroundView(radius: radius)
                    
                    // MARK: - Progress Stroke
                    Circle()
                        .trim(from: 0, to: progress / config.maximumValue)
                        .stroke(Color.blueIndicaor, style: StrokeStyle(lineWidth: strokeWidth + 5, lineCap: .round))
                        .frame(width: radius * 2, height: radius * 2)
                        .rotationEffect(Angle(degrees: 90))
                    
                    // MARK: - Knob
                    KnobView(radius: knobRadius)
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: -4)
                        .offset(y: radius)
                        .rotationEffect(Angle(degrees: Double(progress / config.maximumValue * 360 + 180)))
                        .gesture(
                            DragGesture(minimumDistance: 10)
                                .onChanged({ value in
                                    changeProgress(location: CGPoint(x: value.location.x, y: value.location.y))
                                })
                        )
                        .rotationEffect(Angle(degrees: 180))
                    
                    // MARK: - Outside Indicator
                    ProgressIndicatorView(progress: $progress, totalValue: config.maximumValue)
                        .rotationEffect(Angle(degrees: 90))
                    
                    
                    // MARK: - Progress Text
                    VStack (spacing: 6) {
                        Text("\(Int(progress))℃")
                            .font(.system(size: 36, weight: .black))
                        Text(progress > 25 ? "Heating..." : "Cooling...")
                            .font(.system(size: 18, weight: .regular))
                    } //: VStack
                    .foregroundColor(.textPrimary)
                    
                } //: ZStack
                .padding(.top, 60)
                
                
                // MARK: - Slider
                FanSliderView()
                    .padding(.top, 70)
                
                // MARK: - Mode Buttons
                FanModeView()
                    .padding(.top, 30)
                
                Spacer()
            } //: VStack
            .padding(.horizontal, 20)
            
        } //: ZStack
        .frame(height: 770)
        .offset(y: barHeight)
        .gesture(
            DragGesture(minimumDistance: 10)
                .onChanged({ value in
                    onChanged(height: value.translation.height)
                })
                .onEnded({ value in
                    onEnded(height: value.translation.height)
                })
        ) //: gesture
    }
    
    
    // MARK: - Function
    
    func onChanged(height: CGFloat) {
        barHeight = height > 0 ? height : swipeBarHeight + height
    }
    
    func onEnded(height: CGFloat) {
        withAnimation(.spring()) {
            if barHeight > 300 {
                barHeight = swipeBarHeight
            } else {
                barHeight = 0
            }
        }
    }
    
    func updateInitialValue() {
//        angleValue = CGFloat(progress / config.maximumValue) * 360
    }
    
    func changeProgress(location: CGPoint) {
        // 特に CGVector でベクトル化する必要はない
        let vector = CGVector(dx: location.x, dy: location.y)
        
        // location と 中心点(今回は(20, 20)あたりが中心だったからknobRadiusを使った) とで成す角度を算出する (-π ~ π)　(-180° ~ 180°) (-3.14 ~ 3.14)
        // π/2 (90°) はずれた角度の調整用
        let angle = atan2(vector.dy - knobRadius, vector.dx - knobRadius) + .pi/2
        
        // 現在 (-π ~ π) に π/2 を足して (-π/2 ~ 3π/2) になっている
        // + ○πして 回転を加えずに (0 ~ 2π)にしたい
        // すでにプラスの (0 ~ 3π/2) の部分はそのままで, マイナス部分の (-π/2 ~ 0) の部分にのみ +2π して ((0 ~ 2π) を作り出す
        let fixedAngle = angle < 0 ? angle + 2 * .pi : angle
        
        // (0 ~ 2π) / 2π * 最大値
        let value = fixedAngle / (2.0 * .pi) * config.maximumValue
        
        if value > config.minimumValue && value < config.maximumValue {
            progress = value
        }
    }
}

// MARK: - Preview

struct ACControlView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
