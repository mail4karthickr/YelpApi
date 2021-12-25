//
//  SwiftUIView.swift
//  
//
//  Created by Karthick Ramasamy on 12/5/21.
//

import SwiftUI
import YelpClient

public struct CategoriesView: View {
    @ObservedObject var viewModel: CategoriesViewModel
    
    public init(viewModel: CategoriesViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List(viewModel.categoriesRowViewModel, id: \.title) {
            CategoriesRowView(viewModel: $0)
        }
        .onAppear {
            viewModel.getCategories()
        }
    }
}

#if DEBUG
struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(viewModel: CategoriesViewModel())
    }
}
#endif
