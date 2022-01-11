//
//  IdeaListPreviewView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 1/7/22.
//

import SwiftUI

struct IdeaListPreviewView: View {
    @EnvironmentObject var viewModel: ViewClusterViewModel
    var idea: Idea
    var bucket: Bucket
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 8, height: 8)
                Text(idea.name)
                Spacer()
                Button {
                    print("edit \(idea.name)")
                    viewModel.editIdeaForm(idea, bucket: bucket)
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
            Divider()
        }
    }
}

struct IdeaListPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        IdeaListPreviewView(idea: MockData.idea1, bucket: MockData.bucket1)
    }
}
