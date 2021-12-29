//
//  ContentView.swift
//  Shared
//
//  Created by Mike Griffin on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World")
                NavigationLink {
                    CreateClusterView()
                } label: {
                    Text("Create a Cluster")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
