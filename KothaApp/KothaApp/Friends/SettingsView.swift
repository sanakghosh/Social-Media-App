//
//  SettingsView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            VStack {
                // Top Sync Message
                Text("Phonebook isn't synced yet.")
                    .foregroundColor(.red)
                    .font(.subheadline) +
                Text(" Sync Now!")
                    .foregroundColor(.blue)
                    .font(.subheadline)
                
                // List of options
                List {
                    Section {
                        HStack {
                            Image(systemName: "person.3.fill") // Placeholder icon for 'Groups'
                                .foregroundColor(.blue)
                            Text("Groups")
                            Spacer()
                            Text("CREATE")
                                .foregroundColor(.green)
                        }
                        
                        HStack {
                            Image(systemName: "person.2.fill") // Placeholder icon for 'Follow Suggestions'
                                .foregroundColor(.green)
                            Text("Follow Suggestions")
                        }
                        
                        HStack {
                            Image(systemName: "person.2.square.stack.fill") // Placeholder icon for 'Followers and Followings'
                                .foregroundColor(.green)
                            Text("Followers and Followings")
                        }
                        
                        HStack {
                            Image(systemName: "magnifyingglass.circle.fill") // Placeholder icon for 'Browse Official Accounts'
                                .foregroundColor(.green)
                            Text("Browse Official Accounts")
                        }
                    }
                    
                    Section(header: Text("Kotha Friends")) {
                        Text("Kotha Friends are people in your phonebook who use Kotha App. Invite them to get more Friends in Kotha. Once they join you can chat, call and more.")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                    Section {
                        HStack {
                            Image(systemName: "plus.circle.fill") // Placeholder for 'Invite & Refer'
                                .foregroundColor(.orange)
                            Text("Invite & Refer")
                        }
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search Friends")
                        }
                        
                        HStack {
                            Image(systemName: "plus.circle.fill") // Placeholder for 'Add Contact'
                                .foregroundColor(.green)
                            Text("Add Contact")
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                // Bottom Tab Bar
//                HStack {
//                    Spacer()
//                    VStack {
//                        Image(systemName: "bubble.left.and.bubble.right.fill") // Chats Tab
//                        Text("Chats")
//                    }
//                    Spacer()
//                    VStack {
//                        Image(systemName: "square.grid.2x2.fill") // Lifestyle Tab
//                        Text("Lifestyle")
//                    }
//                    Spacer()
//                    VStack {
//                        Image(systemName: "square.stack.fill") // Feed Tab
//                        Text("Feed")
//                    }
//                    Spacer()
//                    VStack {
//                        Image(systemName: "person.3.fill") // Communities Tab
//                        Text("Communities")
//                    }
//                    Spacer()
//                    VStack {
//                        Image(systemName: "person.fill") // Friends Tab
//                        Text("Friends")
//                    }
//                }
//                .padding()
//                .background(Color.black)
//                .foregroundColor(.white)
            }
        }
       
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
