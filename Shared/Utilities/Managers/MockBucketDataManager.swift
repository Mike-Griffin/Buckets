//
//  MockBucketDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

struct MockBucketDataManager: BucketDataManager {
    func getClusters() -> [Cluster] {
        return [MockData.cluster1, MockData.cluster2, MockData.cluster3]
    }
}
