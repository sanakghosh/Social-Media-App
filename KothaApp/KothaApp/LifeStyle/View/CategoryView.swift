//
//  CategoryView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI

struct CategoryView: View {
    var title: String
    var color: Color
    
    var body: some View {
        Text(title)
            .font(.subheadline)
            .frame(width: 100, height: 50)
            .background(color.opacity(0.2))
            .cornerRadius(8)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
