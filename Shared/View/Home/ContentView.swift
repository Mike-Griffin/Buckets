//
//  ContentView.swift
//  Shared
//
//  Created by Mike Griffin on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel(clusterManager: MockBucketDataManager())
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.clusters) { cluster in
                        Text(cluster.name)
                    }
                }
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
        ContentView(viewModel: HomeViewModel(clusterManager: MockBucketDataManager()))
    }
}
