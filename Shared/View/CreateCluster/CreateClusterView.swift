//
//  CreateCluster.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import SwiftUI

struct CreateClusterView: View {
    @StateObject var viewModel = CreateClusterViewModel()
    var body: some View {
        Text("Create a Cluster!!!!")
    }
}

struct CreateCluster_Previews: PreviewProvider {
    static var previews: some View {
        CreateClusterView()
    }
}
