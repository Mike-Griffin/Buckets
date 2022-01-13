//
//  MockBucketDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

struct MockBucketDataManager: BucketDataManager {
    var clusters = [MockData.cluster1, MockData.cluster2, MockData.cluster3]
    func createIdea(name: String) -> Idea {
        return Idea(name: name)
    }
    
    func createBucket(name: String, color: Colors?) -> Bucket {
        if let color = color {
            return Bucket(name: name, ideas: [], color: color.rawValue)
        } else {
            return Bucket(name: name, ideas: [], color: "white")
        }
    }
    
    func getClusters() -> [Cluster] {
        return clusters
    }
    
    func editIdea(_ idea: Idea, name: String, bucket: Bucket?) -> Idea {
        var idea = idea
        idea.name = name
        return idea
    }
}
