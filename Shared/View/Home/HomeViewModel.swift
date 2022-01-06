//
//  HomeViewModel.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var clusterManager: BucketDataManager
    let clusters: [Cluster]
    init(clusterManager: BucketDataManager) {
        self.clusterManager = clusterManager
        self.clusters = clusterManager.getClusters()
    }
}
