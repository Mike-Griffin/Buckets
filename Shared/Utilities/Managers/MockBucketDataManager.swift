//
//  MockBucketDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

struct MockBucketDataManager: BucketDataManager {
    func createIdea(name: String) -> Idea {
        return Idea(name: name)
    }
    
    func createBucket(name: String) -> Bucket {
        return Bucket(name: name, ideas: [], color: "yellow")
    }
    
    func getClusters() -> [Cluster] {
        return [MockData.cluster1, MockData.cluster2, MockData.cluster3]
    }
}
