//
//  IdeaListPreviewView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 1/7/22.
//

import SwiftUI

struct IdeaListPreviewView: View {
    var idea: Idea
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 8, height: 8)
                Text(idea.name)
            }
            Divider()
        }
    }
}

struct IdeaListPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        IdeaListPreviewView(idea: MockData.idea1)
    }
}
