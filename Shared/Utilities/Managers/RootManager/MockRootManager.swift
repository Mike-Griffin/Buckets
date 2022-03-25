//
//  MockRootManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 2/26/22.
//

import Foundation

struct MockRootManager: RootDataManager {
    let networkManager = MockNetworkManager()
    
    func getClusters() -> [Cluster] {
        return networkManager.getClusters()
    }
    
    func createCluster(name: String) -> Cluster {
        return Cluster(name: name, buckets: [])
    }
}
