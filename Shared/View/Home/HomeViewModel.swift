//
//  HomeViewModel.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    let clusters: [Cluster]
    init(clusterManager: BucketDataManager) {
        self.clusters = clusterManager.getClusters()
    }
}
