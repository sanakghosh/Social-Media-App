//
//  NavigationBar.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
            }
            Spacer()
            
            VStack(spacing: 4){
                Image("me")
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(CustomRoundedShape(cornerRadii: 20)) // Apply custom corner shape
                    .overlay(
                        Circle()
                            .fill(Color.green)
                            .frame(width: 15, height: 15)
                            .offset(x: 12, y: 12), alignment: .bottomTrailing
                    )
                
            }
            Spacer()
            
            HStack(spacing: 10){
                Button {
                    
                } label: {
                    Image(systemName: "bell.badge")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
        .padding(.bottom, 700)
        .frame(alignment: .top)
        .tint(.white)

    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
