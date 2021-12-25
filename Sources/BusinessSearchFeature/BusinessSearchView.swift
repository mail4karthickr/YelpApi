//
//  SwiftUIView.swift
//  
//
//  Created by Karthick Ramasamy on 12/6/21.
//

import SwiftUI
import Combine

public struct BusinessSearchView: View {
    @ObservedObject var viewModel: BusinessSearchViewModel

    public init(viewModel: BusinessSearchViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Text("BusinessSearch")
    }
}

struct BusinessSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSearchView(viewModel: BusinessSearchViewModel())
    }
}
