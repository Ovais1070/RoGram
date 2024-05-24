//
//  SplashView.swift
//  Rogram
//
//  Created by Ovais Khan on 5/23/24.
//

import SwiftUI

struct SplashView: View {
    
    var colorArray: [Color]
    @Binding var animateGradient: Bool
    var vm = RoHomeViewModel()
    
    var body: some View {
        
        VStack(spacing: 20) {
            Spacer()
            
            Text("RoGram")
                .font(.system(size: 45))
                .fontWeight(.black)
            
            
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.black)
        .padding(.horizontal)
        .multilineTextAlignment(.center)
        .background {
            LinearGradient(colors: colorArray, startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .hueRotation(.degrees(animateGradient ? 50 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
        }
    }
}

#Preview {
    SplashView(colorArray: [], animateGradient: .constant(true))
}
