//
//  MockData.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/30/21.
//

import Foundation

struct MockData {
    static let idea1 = Idea(name: "Mock Idea 1")
    static let idea2 = Idea(name: "Mock Idea 2")
    static let idea3 = Idea(name: "Mock Idea 3")
    static let idea4 = Idea(name: "Mock Idea 4")
    static let bucket1 = Bucket(name: "Mock Bucket 1", ideas: [idea1])
    static let bucket2 = Bucket(name: "Mock Bucket 2", ideas: [idea2, idea3])
    static let bucket3 = Bucket(name: "Mock Bucket 3", ideas: [idea4])
    static let cluster1 = Cluster(name: "Mock Cluster 1", buckets: [bucket1, bucket2, bucket3])
    static let cluster2 = Cluster(name: "Mock Cluster 2", buckets: [bucket1])
    static let cluster3 = Cluster(name: "Mock Cluster 3", buckets: [bucket2])
}
