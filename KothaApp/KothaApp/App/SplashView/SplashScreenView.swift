//
//  SplashScreenView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 9/23/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @Binding var isPresented: Bool
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    
    var body: some View {
           ZStack{
               Color.black.ignoresSafeArea()
               
               ZStack{
                   Image("logo")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 200, height: 200)
                       .offset(x: 1)
               }
               .scaleEffect(scale)
               
           }
           .onAppear {
               withAnimation(.easeInOut(duration: 1.5)) {
                   scale = CGSize(width: 1, height: 1)
               }
               
               DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                   withAnimation(.easeIn(duration: 0.40)) {
                       scale = CGSize(width: 60, height: 60)
                   }
               }
               
               DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                   withAnimation(.easeIn(duration: 0.2)) {
                       isPresented.toggle()
                   }
               }
               
           }
       }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(isPresented: .constant(true))
    }
}
