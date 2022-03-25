//
//  ContentView.swift
//  Shared
//
//  Created by Mike Griffin on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel(clusterManager: JSONRootDataManager())
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.clusters) { cluster in
                        NavigationLink {
                            ViewClusterView(viewModel: ViewClusterViewModel(clusterManager: JSONClusterDataManager(cluster: cluster)))
                        } label: {
                            Text(cluster.name)
                        }
                    }
                }
                NavigationLink {
                    CreateClusterView(viewModel: CreateClusterViewModel(dataManager: viewModel.dataManager))
                } label: {
                    Text("Create a Cluster")
                }
            }
            .onAppear {
                viewModel.fetchClusters()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: HomeViewModel(clusterManager: MockRootManager()))
    }
}
