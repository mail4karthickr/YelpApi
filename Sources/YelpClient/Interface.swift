//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 11/27/21.
//

import Foundation
import Combine

public struct YelpClient {
    public var allCategories: (String?) -> AnyPublisher<CategoriesGroup, ApiError>
    public var categoryDetails: (String, String?) -> AnyPublisher<CategoryDetail, ApiError>
    public var searchBusiness: (BusinessSearchReq) -> AnyPublisher<BusinessSearch, ApiError>
    public var searchBusinessByPhoneNum: (String, String?) -> AnyPublisher<SearchByPhoneNum, ApiError>
    public var searchTransactions: (Coordinates, String?) -> AnyPublisher<SearchTransactions, ApiError>
    public var businessDetails: (String, String?) -> AnyPublisher<BusinessDetails, ApiError>
    public var reviews: (String, String?) -> AnyPublisher<Reviews, ApiError>
    public var autoComplete: (String, Coordinates, String?) -> AnyPublisher<AutoComplete, ApiError>
    public var eventSearch: (EventsReq?) -> AnyPublisher<EventSearch, ApiError>
    public var eventLookup: (String, String?) -> AnyPublisher<Event, ApiError>
    public var featuredEvent: (LocationEither, String?) -> AnyPublisher<EventLookup, ApiError>
    
    public init(
        allCategories: @escaping (String?) -> AnyPublisher<CategoriesGroup, ApiError>,
        categoryDetails: @escaping (String, String?) -> AnyPublisher<CategoryDetail, ApiError>,
        searchBusiness: @escaping (BusinessSearchReq) -> AnyPublisher<BusinessSearch, ApiError>,
        searchBusinessByPhoneNum: @escaping (String, String?) -> AnyPublisher<SearchByPhoneNum, ApiError>,
        searchTransactions: @escaping (Coordinates, String?) -> AnyPublisher<SearchTransactions, ApiError>,
        businessDetails: @escaping (String, String?) -> AnyPublisher<BusinessDetails, ApiError>,
        reviews: @escaping (String, String?) -> AnyPublisher<Reviews, ApiError>,
        autoComplete: @escaping (String, Coordinates, String?) -> AnyPublisher<AutoComplete, ApiError>,
        eventSearch: @escaping (EventsReq?) -> AnyPublisher<EventSearch, ApiError>,
        eventLookup: @escaping (String, String?) -> AnyPublisher<Event, ApiError>,
        featuredEvent: @escaping (LocationEither, String?) -> AnyPublisher<EventLookup, ApiError>
    ) {
        self.allCategories = allCategories
        self.categoryDetails = categoryDetails
        self.searchBusiness = searchBusiness
        self.searchBusinessByPhoneNum = searchBusinessByPhoneNum
        self.searchTransactions = searchTransactions
        self.businessDetails = businessDetails
        self.reviews = reviews
        self.autoComplete = autoComplete
        self.eventSearch = eventSearch
        self.eventLookup = eventLookup
        self.featuredEvent = featuredEvent
    }
}
