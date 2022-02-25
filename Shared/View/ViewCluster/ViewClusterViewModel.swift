//
//  ViewClusterViewModel.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/30/21.
//

import Foundation

class ViewClusterViewModel: ObservableObject {
    var clusterManager: ClusterDataManager
    @Published var cluster: Cluster
    @Published var showNewBucketForm = false
    @Published var showNewIdeaForm = false
    @Published var bucketName = ""
    @Published var ideaName = ""
    @Published var selectedColor: Colors?
    @Published var selectedBucketIndex = 0
    @Published var editIdea: Idea?
    init(clusterManager: ClusterDataManager) {
        self.clusterManager = clusterManager
        self.cluster = clusterManager.cluster
    }
    
    func createBucket(name: String, color: Colors?) {
        let newBucket = clusterManager.createBucket(name: name, color: color)
        cluster.buckets.append(newBucket)
    }
    
    func saveIdea(name: String, bucket: Bucket?) {
        if let idea = editIdea {
            // need to rethink the data model here
            // I want to push all this logic to my dataManager because this is going to be handled
            // on the database side. Essentially I'd want to make all the changes and then refresh
            let (editedIdea, removeBucket, addBucket) = clusterManager.editIdea(idea, name: name, bucket: bucket)
            cluster = clusterManager.cluster
//            print(editedIdea)
//            if let removeBucket = removeBucket {
//                if let index = cluster.buckets.firstIndex(where: { $0.id == removeBucket.id }) {
//                    cluster.buckets[index] = removeBucket
//                }
//            }
//            if let addBucket = addBucket {
//                if let index = cluster.buckets.firstIndex(where: { $0.id == addBucket.id }) {
//                    cluster.buckets[index] = addBucket
//                }
//            }
//            if let bucket = bucket {
//                if !bucket.ideas.contains(where: { $0 == idea }) {
//                    for i in 0 ..< cluster.buckets.count {
//                        print("we in here \(i)")
//                        if cluster.buckets[i].ideas.contains(where: { $0 == idea }) {
//                            print("should remove at \(i)")
//                            cluster.buckets[i].ideas.removeAll(where: { $0 == idea })
//                        }
//                        if bucket.id == cluster.buckets[i].id {
//                            print("should append at \(i)")
//                            cluster.buckets[i].ideas.append(editedIdea)
//                        }
//                    }
//                }
//            }
        } else {
            let (_, editedBucket) = clusterManager.createIdea(name: name, bucket: bucket)
            if let editedBucket = editedBucket {
                if let index = cluster.buckets.firstIndex(where: { $0.id == editedBucket.id }) {
                    cluster.buckets[index] = editedBucket
                }
            }
        }
        ideaName = ""
        selectedBucketIndex = 0
        editIdea = nil
        clusterManager.cluster = cluster
    }
    
    func editIdeaForm(_ idea: Idea, bucket: Bucket) {
        editIdea = idea
        ideaName = idea.name
        selectedBucketIndex = cluster.buckets.firstIndex(where: { $0.id == bucket.id }) ?? 0
        showNewIdeaForm = true
    }
}
