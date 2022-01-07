//
//  AddButtonView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 1/6/22.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        Image(systemName: "plus.circle")
            .resizable()
            .frame(width: 36, height: 36)
            .tint(.primary)
            .padding(.horizontal)
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
