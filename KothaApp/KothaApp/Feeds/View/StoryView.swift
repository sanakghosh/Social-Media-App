//
//  StoryView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI

struct StoryView: View {
    var imageName: String
    var title: String
    
    var body: some View {
        VStack {
            Image(imageName) // Replace with actual image
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 150)
                .clipShape(CustomRoundedShape(cornerRadii: 20))
            Text(title)
                .font(.caption)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
