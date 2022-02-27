//
//  CreateCluster.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import SwiftUI

struct CreateClusterView: View {
    @StateObject var viewModel: CreateClusterViewModel
    var body: some View {
        VStack {
            TextField("Name", text: $viewModel.name)
            Button {
                viewModel.saveCluster()
            } label: {
                Text("Save")
            }

        }
        .padding()
    }
}

struct CreateCluster_Previews: PreviewProvider {
    static var previews: some View {
        CreateClusterView(viewModel: CreateClusterViewModel(dataManager: MockRootManager()))
    }
}
