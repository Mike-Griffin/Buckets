//
//  ViewClusterView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/30/21.
//

import SwiftUI

struct ViewClusterView: View {
    @StateObject var viewModel = ViewClusterViewModel(cluster: MockData.cluster1)
    var body: some View {
        Text(viewModel.cluster.name)
    }
}

struct ViewClusterView_Previews: PreviewProvider {
    static var previews: some View {
        ViewClusterView()
    }
}
