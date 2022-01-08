//
//  NewIdeaFormView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 1/7/22.
//

import SwiftUI

struct NewIdeaFormView: View {
    @ObservedObject var viewModel: ViewClusterViewModel
    var width: CGFloat
    var body: some View {
        VStack {
            Text("Create Idea")
            TextField("Name", text: $viewModel.ideaName)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
            Button {
                viewModel.createIdea(name: viewModel.ideaName, bucket: MockData.bucket1)
                viewModel.showNewIdeaForm = false
            } label: {
                Text("Save")
            }
            
        }
        .frame(width: width, height: width * 0.8, alignment: .center)
        .background(.white)    }
}

struct NewIdeaFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewIdeaFormView(viewModel: ViewClusterViewModel(clusterManager: MockBucketDataManager(), cluster: MockData.cluster1), width: 300)
    }
}
