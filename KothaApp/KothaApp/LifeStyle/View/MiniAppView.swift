//
//  MiniAppView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI

struct MiniAppView: View {
    var iconName: String
    var title: String
    
    var body: some View {
        VStack {
            Image(iconName) // Replace with actual app icons
                .resizable()
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            Text(title)
                .font(.caption)
        }
    }
}

struct MiniAppView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
