//
//  CreateClusterViewModel.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation

class CreateClusterViewModel: ObservableObject {
    let dataManager: RootDataManager
    @Published var name: String = ""
    
    init(dataManager: RootDataManager) {
        print("create cluster vm init called")
        self.dataManager = dataManager
    }
    
    func saveCluster() {
        let cluster = dataManager.createCluster(name: name)
        print(cluster)
    }
}
