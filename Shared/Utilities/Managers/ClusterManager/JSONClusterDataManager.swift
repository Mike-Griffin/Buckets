//
//  JSONBucketDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

struct JSONClusterDataManager: ClusterDataManager {
    var cluster: Cluster
    let networkManager = JSONNetworkManager()
    
    func createBucket(name: String, color: Colors?) -> Bucket {
        // NOTE: In this current JSON version, I write the entire Cluster
        // to file. Meaning when I update a bucket in any way, I must only
        // write to save the cluster. This will be different on the database
        // where I can save and edit the buckets and the database will have reference
        let bucket = Bucket(name: name, ideas: [], color: color?.rawValue ?? DefaultValues.defaultColors)
        cluster.buckets.append(bucket)
        networkManager.saveCluster(cluster: cluster)
        return bucket
    }
    
    func createIdea(name: String, bucket: Bucket?) {
        print("do it")
        let idea = Idea(name: name)
        if var bucket = bucket {
            bucket.ideas.append(idea)
            if let index = cluster.buckets.firstIndex(where: { $0.id == bucket.id }) {
                cluster.buckets[index] = bucket
            }
        }
        networkManager.saveCluster(cluster: cluster)
    }
    
    func editIdea(_ idea: Idea, name: String, bucket: Bucket?) {
        print("do it")
        let newIdea = Idea(name: name)
        for (i, b) in cluster.buckets.enumerated() {
            if b.ideas.contains(idea) {
                if bucket == nil || bucket!.id != b.id {
                    // need to remove the idea from this bucket and add it to another
                    let index = b.ideas.firstIndex(where: { $0.id == idea.id })!
                    cluster.buckets[i].ideas.remove(at: index)
                    if bucket != nil {
                        if let bucketIndex = cluster.buckets.firstIndex(where: { $0.id == bucket!.id }) {
                            cluster.buckets[bucketIndex].ideas.append(newIdea)
                        }
                            
                    }
                }
                else {
                    // just replace the idea in the bucket
                    let index = b.ideas.firstIndex(where: { $0.id == idea.id })!
                    cluster.buckets[i].ideas[index] = newIdea
                }
            }
        }
        networkManager.saveCluster(cluster: cluster)
    }
}
