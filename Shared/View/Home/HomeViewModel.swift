//
//  HomeViewModel.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var dataManager: RootDataManager
    @Published var clusters: [Cluster]
    init(clusterManager: RootDataManager) {
        self.dataManager = clusterManager
        // currently setting it to empty because I have on appear calling fetch clusters
        // should come up with a better way to read clusters only when necessary
        self.clusters = []
    }
    
    func fetchClusters() {
        print("fetching clusters...")
        self.clusters = dataManager.getClusters()
    }
}
