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
    @Published var showNewIdeaForm = false
    @Published var bucketName = ""
    @Published var ideaName = ""
    init(clusterManager: BucketDataManager, cluster: Cluster) {
        self.clusterManager = clusterManager
        self.cluster = cluster
    }
    
    func createBucket(name: String) {
        let newBucket = clusterManager.createBucket(name: name)
        cluster.buckets.append(newBucket)
    }
    
    func createIdea(name: String, bucket: Bucket?) {
        let newIdea = clusterManager.createIdea(name: name)
        if let bucket = bucket {
            if let index = cluster.buckets.firstIndex(where: { $0.id == bucket.id }) {
                cluster.buckets[index].ideas.append(newIdea)
            }
        }
    }
}
