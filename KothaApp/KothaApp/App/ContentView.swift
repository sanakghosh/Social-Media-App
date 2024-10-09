//
//  ContentView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 9/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainTabView()
            .tint(Color.cyan)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
