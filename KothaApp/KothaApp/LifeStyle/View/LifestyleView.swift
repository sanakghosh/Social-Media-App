//
//  LifestyleView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI

struct LifestyleView: View {
    var body: some View {
        
        ZStack{
            NavigationBar()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10){
                    HStack{
                        Text("Mini Apps")
                        
                        Spacer()
                    }
                    // Mini Apps Section
                    
                    VStack(spacing: 25) {
                        
                        HStack(spacing: 30){
                            MiniAppView(iconName: "Daraz", title: "Daraz")
                            MiniAppView(iconName: "Chaldal", title: "Chaldal")
                            MiniAppView(iconName: "10", title: "10Minute")
                            MiniAppView(iconName: "DailyCricket", title: "DailyCric")
                            Spacer()
                        }
                        HStack(spacing: 30){
                            MiniAppView(iconName: "Gamezop", title: "Gamezop")
                            MiniAppView(iconName: "Sheba", title: "Sheba XYZ")
                            Spacer()
                        }
                        
                        
                    }
                    .padding()
                    
                    // Shop Categories
                    VStack {
                        HStack{
                            Text("Shop")
                            
                            Spacer()
                        }
                        
                        HStack(spacing: 20) {
                            CategoryView(title: "Health & Beauty", color: .cyan)
                            CategoryView(title: "Fashion", color: .cyan)
                            CategoryView(title: "Toys & Games", color: .cyan)
                        }
                        .padding()
                        
                        Button(action: {
                            // Action for view all products
                        }) {
                            Text("View All Product")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Spacer()
                    
                    //Featured Section
                    FeaturedView()
                    
                    Spacer()
                }
                .padding()
                
                
            }
            .padding(.top, 80)
            
        }
        
    }
    
}

struct LifestyleView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
