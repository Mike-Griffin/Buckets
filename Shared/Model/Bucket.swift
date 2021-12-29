//
//  Bucket.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

protocol Bucket {
    var name: String { get }
    var ideas: [Idea] { get }
}

struct MockBucket: Bucket {
    let name: String
    
    let ideas: [Idea]
}
