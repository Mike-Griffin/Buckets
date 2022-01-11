//
//  BucketDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

protocol BucketDataManager {
    func getClusters() -> [Cluster]
    func createBucket(name: String) -> Bucket
    func createIdea(name: String) -> Idea
    func editIdea(_ idea: Idea, name: String, bucket: Bucket?) -> Idea
}
