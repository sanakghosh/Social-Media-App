//
//  FeedView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack {
            // Header with Profile and Search Bar
            
            NavigationBar()
            
//            HStack {
//                Image(systemName: "person.circle.fill") // Profile icon
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .padding(.leading)
//
//                Spacer()
//
//                HStack {
//                    Image(systemName: "magnifyingglass")
//                    Text("Search")
//                        .foregroundColor(.gray)
//                }
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(8)
//
//                Spacer()
//
//                HStack {
//                    Image(systemName: "bell")
//                    Image(systemName: "line.3.horizontal")
//                }
//                .padding(.trailing)
//            }
//            .padding(.top)
            
            // Navigation Tabs (HOME, MARKETPLACE, etc.)
            ScrollView(.vertical, showsIndicators: false) {
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack{
                        Text("HOME")
                            .frame(width: 70, height: 8)
                            .padding()
                            .background(Color.cyan)
                            .cornerRadius(8)
                        
                        Spacer()
                        
                        Text("MARKET")
                            .frame(width: 70, height: 8)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        
                        Spacer()
                        
                        Text("PUBLIC")
                            .frame(width: 70, height: 8)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        
                        Spacer()
                        
                        Text("FOLLOW")
                            .font(.headline)
                            .frame(width: 70, height: 13)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    
                }
                
                // Story Section
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        StoryView(imageName: "me", title: "Create Story")
                            .overlay{
                                Image(systemName: "plus.app.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(.top, 100)
                                    .padding(.leading,50)
                                    .foregroundColor(.black)
                            }
                        StoryView(imageName: "pic01", title: "Ashis Ahamed")
                        StoryView(imageName: "pic02", title: "Kritaa")
                        StoryView(imageName: "pic03", title: "Taylor Bond")
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 30)
                
                Divider().padding(.vertical)
                
                // Feed Posts
                PostView(username: "Sanak Ghosh", profileImage: "me", postImage: "art", timeAgo: "52 mins ago", postText: "Sample post text in another language or content.", likes: 12, comments: 5)
//
                PostView(username: "Arham Chy", profileImage: "P19", postImage: "post01", timeAgo: "2 hours ago", postText: "Chasing the sun.", likes: 27, comments: 9)
                
                Spacer()
            }
            .padding(.top, 80)

            }
        }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
