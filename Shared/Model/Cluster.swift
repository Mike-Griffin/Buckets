//
//  Cluster.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

struct Cluster: Identifiable {
    let id = UUID()
    let name: String
    var buckets: [Bucket]
}
