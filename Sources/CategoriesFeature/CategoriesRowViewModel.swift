//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/5/21.
//

import Foundation
import Combine
import YelpClient

extension UserDefaults {
    @objc var favourites: [String] {
        return array(forKey: "favourites") as? [String] ?? []
    }
}

public class CategoriesRowViewModel: ObservableObject {
    @Published var title: String
    @Published var isFavourite = false
    
    private var userDefaults: UserDefaults
    private var cancellables = Set<AnyCancellable>()
    
    public init(category: YelpCategory, userDefaults: UserDefaults = .standard) {
        self.title = category.title
        self.userDefaults = userDefaults
        userDefaults
            .publisher(for: \.favourites)
            .map { $0.contains(category.title) ? true : false }
            .assign(to: \.isFavourite, on: self)
            .store(in: &cancellables)
    }
    
    public func setAsFavouriteTapped() {
        var favourites = userDefaults.stringArray(forKey: "favourites") ?? []
        if favourites.contains(title) {
            favourites.removeAll { $0 == title }
            userDefaults.set(favourites, forKey: "favourites")
        } else {
            favourites.append(title)
            userDefaults.set(favourites, forKey: "favourites")
        }
    }
}
