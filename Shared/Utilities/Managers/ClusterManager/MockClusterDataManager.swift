//
//  MockBucketDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

class MockClusterDataManager: ClusterDataManager {
    var cluster: Cluster
    
    init(cluster: Cluster) {
        self.cluster = cluster
    }
    
    func createIdea(name: String, bucket: Bucket?) {
        let idea = Idea(name: name)
        var tempBucket = bucket
        if tempBucket != nil {
            appendIdeaToBucket(idea: idea, bucket: &tempBucket!)
        }
    }
    
    func createBucket(name: String, color: Colors?) -> Bucket {
        if let color = color {
            return Bucket(name: name, ideas: [], color: color.rawValue)
        } else {
            return Bucket(name: name, ideas: [], color: "white")
        }
    }
    
    func editIdea(_ idea: Idea, name: String, bucket: Bucket?) {
        var editIdea = idea
        editIdea.name = name
        // find which bucket it belongs to
        var removeBucket = findBucketForIdea(idea)
        var addBucket = bucket != nil ? bucket : cluster.buckets[0]
        if removeBucket?.id == addBucket?.id {
            removeIdeaFromBucket(idea: editIdea, bucket: &addBucket)
            appendIdeaToBucket(idea: editIdea, bucket: &addBucket!)
            return 
        }
        removeIdeaFromBucket(idea: editIdea, bucket: &removeBucket)
        // if the bucket is not set, then we are appending to the no bucket field
        appendIdeaToBucket(idea: editIdea, bucket: &addBucket!)
    }
    
    private func findBucketForIdea(_ idea: Idea) -> Bucket? {
        let foundBucket = cluster.buckets.first(where: { $0.ideas.contains(where: { $0.id == idea.id})})
        return foundBucket
    }
    
    private func appendIdeaToBucket(idea: Idea, bucket: inout Bucket) {
        var ideas = bucket.ideas
        ideas.append(idea)
        bucket.ideas = ideas
        replaceBucket(bucket)
    }
    
    private func removeIdeaFromBucket(idea: Idea, bucket: inout Bucket?) {
        guard bucket != nil else {
            return
        }

        guard let index = bucket!.ideas.firstIndex(where: { $0.id == idea.id }) else {
            return
        }
        bucket!.ideas.remove(at: index)
        replaceBucket(bucket!)
    }
    
    private func replaceBucket(_ bucket: Bucket) {
        if let index = cluster.buckets.firstIndex(where: { $0.id == bucket.id}) {
            cluster.buckets[index] = bucket
        }
    }
}
