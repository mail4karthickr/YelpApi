//
//  SwiftUIView.swift
//  
//
//  Created by Karthick Ramasamy on 12/5/21.
//

import SwiftUI
import YelpClient

public struct CategoriesRowView: View {
    @ObservedObject var viewModel: CategoriesRowViewModel

    public var body: some View {
        HStack {
            Text(viewModel.title)
        }
    }
}

struct CategoriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesRowView(
            viewModel: CategoriesRowViewModel(
                category: YelpCategory(alias: "", title: "", parentAliases: nil, countryWhitelist: nil, countryBlacklist: nil)
            )
        )
    }
}
