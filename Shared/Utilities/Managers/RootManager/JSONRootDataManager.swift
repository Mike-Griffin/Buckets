//
//  JSONRootDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 2/26/22.
//

import Foundation

struct JSONRootDataManager: RootDataManager {
    let networkManager: JSONNetworkManager
    
    init() {
        self.networkManager = JSONNetworkManager()
    }
    
    func getClusters() -> [Cluster] {
        return networkManager.getClusters()
    }
    
    func createCluster(name: String) -> Cluster {
        let cluster = Cluster(name: name, buckets: [])
        networkManager.saveCluster(cluster: cluster)
        return cluster
    }
}
