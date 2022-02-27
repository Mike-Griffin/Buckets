//
//  HomeViewModel.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var dataManager: RootDataManager
    let clusters: [Cluster]
    init(clusterManager: RootDataManager) {
        self.dataManager = clusterManager
        self.clusters = clusterManager.getClusters()
    }
}
