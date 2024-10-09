//
//  PostView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI

struct PostView: View {
    var username: String
    var profileImage: String
    var postImage: String
    var timeAgo: String
    var postText: String
    var likes: Int
    var comments: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Post Header (User Info)
            HStack {
                Image(profileImage) // User Profile Icon
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(CustomRoundedShape(cornerRadii: 20)) // Apply custom corner shape
                
                
                VStack(alignment: .leading) {
                    Text(username).bold()
                    Text(timeAgo)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 5)
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            // Post Content
            Text(postText)
                .padding(.horizontal)
            
            Image(postImage) // Placeholder for post image (if needed)
                .resizable()
                .frame(height: 200)
                .cornerRadius(8)
                .padding(.horizontal)
            
            // Like, Comment, Share buttons
            HStack {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                        Text("\(likes)")
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "message.fill")
                        Text("\(comments)")
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Share")
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
        }
        .padding(.vertical)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
