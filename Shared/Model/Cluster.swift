//
//  Cluster.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

protocol Cluster {
    var name: String { get }
    var buckets: [Bucket] { get }
}
