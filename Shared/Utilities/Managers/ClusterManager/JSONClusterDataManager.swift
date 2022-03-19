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
    }
    
    func editIdea(_ idea: Idea, name: String, bucket: Bucket?) {
        print("do it")
    }
}
