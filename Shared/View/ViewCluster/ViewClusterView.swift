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
        let columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 2)
        
        VStack {
            Text(viewModel.cluster.name)
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(viewModel.cluster.buckets) { bucket in
                    VStack {
                        Text(bucket.name)
                        Text("\(bucket.ideas.count) ideas")
                    }
                    .padding()
                }
            }
            Spacer()
        }
    }
}

struct ViewClusterView_Previews: PreviewProvider {
    static var previews: some View {
        ViewClusterView()
    }
}
