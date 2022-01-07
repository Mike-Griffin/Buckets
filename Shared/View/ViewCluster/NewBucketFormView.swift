//
//  NewBucketFormView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 1/6/22.
//

import SwiftUI

struct NewBucketFormView: View {
    @ObservedObject var viewModel: ViewClusterViewModel
    var width: CGFloat
    var body: some View {
        VStack {
            Text("Create Bucket")
            TextField("Name", text: $viewModel.bucketName)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
            Button {
                viewModel.createBucket(name: viewModel.bucketName)
                viewModel.showNewBucketForm = false
            } label: {
                Text("Save")
            }
            
        }
        .frame(width: width, height: width * 0.8, alignment: .center)
        .background(.white)
    }
}

struct NewBucketFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewBucketFormView(viewModel: ViewClusterViewModel(clusterManager: MockBucketDataManager(), cluster: MockData.cluster1), width: 300)
    }
}
