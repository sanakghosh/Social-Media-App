//
//  ContainerView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 9/23/24.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashViewPresented = true
    
    var body: some View {
        if !isSplashViewPresented {
            ContentView()
                .navigationBarHidden(true)
        }else{
            SplashScreenView(isPresented: $isSplashViewPresented)
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
