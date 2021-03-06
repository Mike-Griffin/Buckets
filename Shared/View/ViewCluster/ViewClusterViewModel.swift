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
        let _ = clusterManager.createBucket(name: name, color: color)
        cluster = clusterManager.cluster
        bucketName = ""
        selectedColor = nil
    }
    
    func saveIdea(name: String, bucket: Bucket?) {
        if let idea = editIdea {
            clusterManager.editIdea(idea, name: name, bucket: bucket)
            cluster = clusterManager.cluster
        } else {
            clusterManager.createIdea(name: name, bucket: bucket)
            cluster = clusterManager.cluster
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
