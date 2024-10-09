//
//  FeaturedView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI

struct FeaturedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Featured")
                
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Image("f01") // Replace with actual featured images
                        .resizable()
                        .frame(width: 250, height: 150)
                        .cornerRadius(8)
                    
                    Image("f02")
                        .resizable()
                        .frame(width: 250, height: 150)
                        .cornerRadius(8)
                }
            }
            .padding(.top)
        }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
