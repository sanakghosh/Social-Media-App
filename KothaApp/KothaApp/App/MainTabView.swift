//
//  TabView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 9/23/24.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
//    @EnvironmentObject var viewModel: ReelViewModel
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            ChatView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    Text("Chats")
                }
                .onAppear {
                    selectedTab = 0
                }
                .tag(0)
                .tint(.green)
            
            FeedView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("Feeds")
                }
                .onAppear {
                    selectedTab = 1
                }
                .tag(1)
            
            ReelView()
                .tabItem {
                    Image(systemName: "play.rectangle.on.rectangle.fill")
                    Text("Reels")
                }
                .onAppear {
                    selectedTab = 2
                }
                .tag(2)
            
            LifestyleView()
                .tabItem {
                    Image(systemName: "safari")
                    Text("LifeStyle")
                }
                .onAppear {
                    selectedTab = 3
                }
                .tag(3)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Friends")
                }
                .onAppear {
                    selectedTab = 4
                }
                .tag(4)
        }
        .padding()
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
