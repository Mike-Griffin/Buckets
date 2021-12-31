//
//  MockData.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/30/21.
//

import Foundation

struct MockData {
    static let idea1 = Idea(name: "Mock Idea")
    static let bucket1 = Bucket(name: "Mock Bucket", ideas: [idea1])
    static let cluster1 = Cluster(name: "Mock Cluster 1", buckets: [bucket1])
    static let cluster2 = Cluster(name: "Mock Cluster 2", buckets: [bucket1])
    static let cluster3 = Cluster(name: "Mock Cluster 3", buckets: [bucket1])
}
