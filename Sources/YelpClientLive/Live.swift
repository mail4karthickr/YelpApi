//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 11/27/21.
//

import Foundation
import Combine
import YelpClient

public extension YelpClient {
    static private let apiHost = "api.yelp.com"
    static private let apiKey = "uHVKlKY9Is_SFXvylnM6cmUuT69OxKeFxQtx75Xm_P-OudVwCZMvq98GhbB4pfstq3Eie27pSupxiJftjkpmQ56R8Y00ueOkbiMNQFQGv5EmIfoy8tB5ULa0MEcKXXYx"
    public static let live = Self(
        allCategories: { locale in
            getRequest("/v3/categories")
        },
        categoryDetails: { alias, locale in
            getRequest("/v3/categories/\(alias)")
        },
        searchBusiness: { reqParams in
            getRequest("/v3/businesses/search", parameters: reqParams.dictionaryRepresentation ?? [:])
        },
        searchBusinessByPhoneNum: { num, locale in
            getRequest(
                "/v3/businesses/search/phone",
                parameters: ["phone": num, "locale": locale ?? "en_US"]
            )
        },
        searchTransactions: { coordinates, locale in
            getRequest(
                "/v3/transactions/delivery: food delivery/search",
                parameters: [
                    "latitude": "\(coordinates.latitude)",
                    "longitude": "\(coordinates.longitude)",
                    "locale": locale ?? "en_US"
                ]
            )
        },
        businessDetails: { id, locale in
            getRequest("/v3/businesses/\(id)", parameters: ["locale": locale ?? "en_US"])
        },
        reviews: { id, locale in
            getRequest("/v3/businesses/\(id)/reviews", parameters: ["locale": locale ?? "en_US"])
        },
        autoComplete: { text, coordinate, locale in
            getRequest(
                "/v3/autocomplete",
                parameters: [
                    "text": text,
                    "latitude": "\(coordinate.latitude)",
                    "longitude": "\(coordinate.longitude)",
                    "locale": locale ?? "en_US"
                ]
            )
        },
        eventSearch: { eventsReq in
            getRequest(
                "/v3/events",
                parameters: eventsReq.dictionaryRepresentation ?? [:]
            )
        },
        eventLookup: { id, locale in
            getRequest(
                "/v3/events/\(id)",
                parameters: ["locale": locale ?? "en_US"]
            )
        },
        featuredEvent: { location, locale in
            getRequest(
                "/events/featured",
                parameters: location.dictionaryRepresentation
            )
        }
    )
    
    static func getRequest<T: Decodable>(_ path: String, parameters: [String: Any]? = nil) -> AnyPublisher<T, ApiError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = apiHost
        urlComponents.path = path
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        let urlEncoding = URLEncoding.queryString
        let encodedRequest = try! urlEncoding.encode(request, with: parameters)
        print("Request -- \(encodedRequest)")
        return URLSession.shared.dataTaskPublisher(for: encodedRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                          throw ApiError.invalidStatusCode(response)
                      }
                print("Response -- \(data.prettyPrintedJSONString)")
                return data
            }
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                switch error {
                case let error as Swift.DecodingError:
                    return .decodingFailed(error)
                case let error as URLError:
                    return .sessionFailed(error: error)
                case let apiError as ApiError:
                    return apiError
                default:
                    return .unknown
                }
            }
            .eraseToAnyPublisher()
    }
}

private let decoder: JSONDecoder = {
  let jsonDecoder = JSONDecoder()
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy-MM-dd"
  jsonDecoder.dateDecodingStrategy = .formatted(formatter)
  jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
  return jsonDecoder
}()
