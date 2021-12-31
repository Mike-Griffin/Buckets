//
//  Bucket.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

struct Bucket: Identifiable {
    let id = UUID()
    let name: String
    let ideas: [Idea]
}
