//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 11/27/21.
//

import Foundation

public enum Request {
    case allCategories(locale: String?)
    case categoryDetails(alias: String, locale: String?)
    case searchBusiness(BusinessSearchReq)
    case searchBusinessByPhoneNum(num: String, locale: String?)
    case searchTransactions(coordinate: Coordinates, location: String?)
    case businessDetails(locale: String?)
    case reviews(id: String, locale: String?)
    case autoComplete(text: String, coordinate: Coordinates, locale: String?)
    case eventSearch(EventsReq)
    case eventLookup(id: String, locale: String?)
    case featuredEvent(location: LocationEither, locale: String?)
}
