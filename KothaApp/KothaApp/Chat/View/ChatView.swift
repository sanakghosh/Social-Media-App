//
//  ChatVIew.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 9/23/24.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack{
            
            NavigationBar()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10){
                    HStack{
                        Text("Active Now")
                        
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(1...7, id: \.self) { index in
                                Button {
                                    
                                } label: {
                                    Image("P\(index)")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .clipShape(CustomRoundedShape(cornerRadii: 20)) // Apply custom corner shape
                                        .overlay(
                                            Circle()
                                                .fill(Color.green)
                                                .frame(width: 15, height: 15)
                                                .offset(x: 12, y: 12), alignment: .bottomTrailing
                                        )
                                        .padding()
                                }

                            }
                        }
                    }
                    
                }
                
                VStack(spacing: 10){
                    HStack{
                        Text("Recent Message")
                        Spacer()
                    }
                    
                    ForEach(1...7, id: \.self){ index in
                        
                        Button {
                                
                            } label: {
                                HStack(spacing: 20){
                                    Image("P\(index)")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .clipShape(CustomRoundedShape(cornerRadii: 20)) // Apply custom corner shape
                                        .overlay(
                                            Circle()
                                                .fill(Color.green)
                                                .frame(width: 15, height: 15)
                                                .offset(x: 12, y: 12), alignment: .bottomTrailing
                                        )
                                        .padding()
                                    
                                    VStack(alignment: .leading, spacing: 7){
                                        Text("Sabuz Alam")
                                            .bold()
                                        
                                        Text("Kothay acho ekhn?")
                                            .font(.system(size: 15, weight: .thin))
                                        
                                    }
                                    Spacer()
                                    
                                    VStack{
                                        Text("5 min ago")
                                            .font(.system(size: 10, weight: .thin))
                                    }
                                    
                                }
                                .tint(.primary)
                                
                                Spacer()
                                
                            }
                    }
                    
                }
                .padding(.top)
                
            }
            .padding(.top, 80)
            
        }
    }
}

struct ChatVIew_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
