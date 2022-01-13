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
        self.clusterManager = clusterManager
        self.cluster = cluster
    }
    
    func createBucket(name: String) {
        let newBucket = clusterManager.createBucket(name: name)
        cluster.buckets.append(newBucket)
    }
    
    func saveIdea(name: String, bucket: Bucket?) {
        if let idea = editIdea {
            // need to rethink the data model here
            // I want to push all this logic to my dataManager because this is going to be handled
            // on the database side. Essentially I'd want to make all the changes and then refresh
            let editedIdea = clusterManager.editIdea(idea, name: name, bucket: bucket)
            print(editedIdea)
            if let bucket = bucket {
                if !bucket.ideas.contains(where: { $0 == idea }) {
                    for i in 0 ..< cluster.buckets.count {
                        print("we in here \(i)")
                        if cluster.buckets[i].ideas.contains(where: { $0 == idea }) {
                            print("should remove at \(i)")
                            cluster.buckets[i].ideas.removeAll(where: { $0 == idea })
                        }
                        if bucket.id == cluster.buckets[i].id {
                            print("should append at \(i)")
                            cluster.buckets[i].ideas.append(editedIdea)
                        }
                    }
                }
            }
        } else {
            let newIdea = clusterManager.createIdea(name: name)
            print(newIdea)
            if let bucket = bucket {
                if let index = cluster.buckets.firstIndex(where: { $0.id == bucket.id }) {
                    cluster.buckets[index].ideas.append(newIdea)
                }
            }
        }
        ideaName = ""
        selectedBucketIndex = 0
        editIdea = nil
    }
    
    func editIdeaForm(_ idea: Idea, bucket: Bucket) {
        editIdea = idea
        ideaName = idea.name
        selectedBucketIndex = cluster.buckets.firstIndex(where: { $0.id == bucket.id }) ?? 0
        showNewIdeaForm = true
    }
}
