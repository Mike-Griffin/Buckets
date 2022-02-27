//
//  Cluster.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

struct Cluster: Codable, Identifiable {
    let id: UUID
    let name: String
    var buckets: [Bucket]
    
    init(name: String, buckets: [Bucket]) {
        self.id = UUID()
        self.name = name
        self.buckets = buckets
        self.buckets.insert(Bucket.emptyBucket, at: 0)
    }
    
    private enum CodingKeys : String, CodingKey { case id, name, buckets }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        buckets = try container.decode([Bucket].self, forKey: .buckets)
        if buckets.isEmpty || buckets[0].name != Bucket.emptyBucket.name {
            print("!!!!: Yeah it's appending here")
            self.buckets.insert(Bucket.emptyBucket, at: 0)
        }
    }
}
