//
//  HomeViewModel.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var clusterManager: NetworkManager
    let clusters: [Cluster]
    init(clusterManager: NetworkManager) {
        self.clusterManager = clusterManager
        self.clusters = clusterManager.getClusters()
    }
}
