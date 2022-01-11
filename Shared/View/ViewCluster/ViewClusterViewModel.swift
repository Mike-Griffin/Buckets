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
    @Published var selectedBucketIndex = 0
    @Published var editIdea: Idea?
    init(clusterManager: BucketDataManager, cluster: Cluster) {
        print("init is called with \(cluster.name)")
        self.clusterManager = clusterManager
        self.cluster = cluster
    }
    
    func createBucket(name: String) {
        let newBucket = clusterManager.createBucket(name: name)
        cluster.buckets.append(newBucket)
    }
    
    func createIdea(name: String, bucket: Bucket?) {
        if var idea = editIdea {
            idea.name = name
            
        } else {
            let newIdea = clusterManager.createIdea(name: name)
            if let bucket = bucket {
                if let index = cluster.buckets.firstIndex(where: { $0.id == bucket.id }) {
                    cluster.buckets[index].ideas.append(newIdea)
                }
            }
        }
    }
    
    func editIdeaForm(_ idea: Idea, bucket: Bucket) {
        editIdea = idea
        ideaName = idea.name
        selectedBucketIndex = cluster.buckets.firstIndex(where: { $0.id == bucket.id }) ?? 0
        showNewIdeaForm = true
    }
}
