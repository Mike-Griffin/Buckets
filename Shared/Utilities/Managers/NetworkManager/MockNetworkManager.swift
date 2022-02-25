//
//  MockNetworkManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 2/24/22.
//

import Foundation

struct MockNetworkManager: NetworkManager {
    var clusters = [MockData.cluster1, MockData.cluster2, MockData.cluster3]

    func getClusters() -> [Cluster] {
        return clusters
    }
}
