//
//  MockBucketDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

struct MockBucketDataManager: BucketDataManager {
    func getClusters() -> [Cluster] {
        let idea1 = Idea(name: "Mock Idea")
        let bucket1 = Bucket(name: "Mock Bucket", ideas: [idea1])
        let cluster1 = Cluster(name: "Mock Cluster 1", buckets: [bucket1])
        let cluster2 = Cluster(name: "Mock Cluster 2", buckets: [bucket1])
        let cluster3 = Cluster(name: "Mock Cluster 3", buckets: [bucket1])
        return [cluster1, cluster2, cluster3]
    }
}
