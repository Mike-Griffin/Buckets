//
//  Cluster.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

struct Cluster: Codable, Identifiable {
    let id = UUID()
    let name: String
    var buckets: [Bucket]
    
    init(name: String, buckets: [Bucket]) {
        self.name = name
        self.buckets = buckets
        self.buckets.insert(Bucket.emptyBucket, at: 0)
    }
}
