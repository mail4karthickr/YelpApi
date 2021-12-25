//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 11/27/21.
//

import Foundation
import Combine

extension YelpClient {
    public static let mock = Self { _ in
        return Just(
            CategoriesGroup(
                categories: [.mock]
            )
        )
        .setFailureType(to: ApiError.self)
        .eraseToAnyPublisher()
    } categoryDetails: { _, _ in
        Empty().eraseToAnyPublisher()
    } searchBusiness: { _ in
        Empty().eraseToAnyPublisher()
    } searchBusinessByPhoneNum: { _, _ in
        Empty().eraseToAnyPublisher()
    } searchTransactions: { _, _ in
        Empty().eraseToAnyPublisher()
    } businessDetails: { _, _ in
        Empty().eraseToAnyPublisher()
    } reviews: { _, _ in
        Empty().eraseToAnyPublisher()
    } autoComplete: { _, _, _ in
        Empty().eraseToAnyPublisher()
    } eventSearch: { _ in
        Empty().eraseToAnyPublisher()
    } eventLookup: { _, _ in
        Empty().eraseToAnyPublisher()
    } featuredEvent: { _, _ in
        Empty().eraseToAnyPublisher()
    }
}

extension YelpCategory {
    static let mock = Self(alias: "alias", title: "category1", parentAliases: [], countryWhitelist: [], countryBlacklist: [])
}
