//
//  MockBucketDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

struct MockClusterDataManager: ClusterDataManager {
    func createIdea(name: String, bucket: Bucket?) -> (Idea, Bucket?) {
        let idea = Idea(name: name)
        var tempBucket = bucket
        if tempBucket != nil {
            appendIdeaToBucket(idea: idea, bucket: &tempBucket!)
        }
        return (Idea(name: name), tempBucket)
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
    
    func editIdea(_ idea: Idea, name: String, bucket: Bucket?, cluster: Cluster) -> (Idea, Bucket?, Bucket?) {
        var idea = idea
        idea.name = name
        var removeBucket = 
        return idea
    }
    
    func appendIdeaToBucket(idea: Idea, bucket: inout Bucket) {
        var ideas = bucket.ideas
        ideas.append(idea)
        bucket.ideas = ideas
    }
}
