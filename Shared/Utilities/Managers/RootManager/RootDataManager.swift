//
//  RootDataManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 2/26/22.
//

import Foundation

protocol RootDataManager {
    func getClusters() -> [Cluster]
    func createCluster(name: String) -> Cluster
}
