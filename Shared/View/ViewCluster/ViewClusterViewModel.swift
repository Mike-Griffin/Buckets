//
//  ViewClusterViewModel.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/30/21.
//

import Foundation

class ViewClusterViewModel: ObservableObject {
    var clusterManager: BucketDataManager
    @Published var cluster: Cluster
    @Published var showNewBucketForm = false
    @Published var bucketName = ""
    init(clusterManager: BucketDataManager, cluster: Cluster) {
        print("init is called with \(cluster.name)")
        self.clusterManager = clusterManager
        self.cluster = cluster
    }
    
    func createBucket(name: String) {
        let newBucket = clusterManager.createBucket(name: name)
        cluster.buckets.append(newBucket)
    }
}
