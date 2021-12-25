//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/5/21.
//

import Foundation
import YelpClient
import Combine
import Common

public class CategoriesViewModel: ObservableObject {
    @Published var categoriesRowViewModel = [CategoriesRowViewModel]()
    @Published var loading = false
    @Published var error: String?
    @Published var route: Route?

    private var cancellables = Set<AnyCancellable>()
    
    enum Route {
        case categoryDetail
    }

    public init(
        categoriesRowViewModel: [CategoriesRowViewModel] = []
    ) {
        self.categoriesRowViewModel = categoriesRowViewModel
    }
    
    public func getCategories() {
        self.loading = true
        AppEnvironment.current.apiService.allCategories(nil)
            .sink(
                receiveCompletion: { completion in
                    self.loading = false
                    guard case .failure = completion else {
                        return
                    }
                    self.error = "error"
                },
                receiveValue: { value in
                    self.categoriesRowViewModel = value.categories.map { CategoriesRowViewModel(category: $0) }
                }
            )
            .store(in: &cancellables)
    }
    
    public func setCategoryDetailNavigation(isActive: Bool) {
        self.route = isActive ? .categoryDetail : nil
    }
}

