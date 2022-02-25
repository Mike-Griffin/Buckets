//
//  BucketDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

protocol ClusterDataManager {
    func createBucket(name: String, color: Colors?) -> Bucket
    func createIdea(name: String, bucket: Bucket?) -> (Idea, Bucket?) 
    func editIdea(_ idea: Idea, name: String, bucket: Bucket?) -> (Idea, Bucket?)
}
