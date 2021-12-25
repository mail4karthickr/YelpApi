//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/4/21.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case head = "HEAD"
    case delete = "DELETE"
}

public typealias Parameters = [String: Any]

protocol ParameterEncoding {
    func encode(_ urlRequest: URLRequest, with parameters: Parameters?) throws -> URLRequest
}

public struct URLEncoding: ParameterEncoding {
    
    public enum Destination {
        case methodDependent
        case queryString
        case httpBody
        
        func encodesParametersInUrl(for method: HTTPMethod) -> Bool {
            switch self {
            case .methodDependent: return [.get, .head, .delete].contains(method)
            case .queryString: return true
            case .httpBody: return false
            }
        }
    }
    
    public enum ArrayEncoding {
        case brackets
        case noBrackets
        case indexInBrackets
        
        func encode(key: String, atIndex index: Int) -> String {
            switch self {
            case .brackets:
                return "\(key)[]"
            case .noBrackets:
                return key
            case .indexInBrackets:
                return "\(key)[\(index)]"
            }
        }
    }
    
    public enum BoolEncoding {
        case numeric
        case literal
        
        func encode(value: Bool) -> String {
            switch self {
            case .numeric:
                return value ? "1" : "0"
            case .literal:
                return value ? "true" : "false"
            }
        }
    }
    
    public static var `default`: URLEncoding { URLEncoding() }
    public static var queryString: URLEncoding { URLEncoding(destination: .queryString) }
    public static var httpBody: URLEncoding { URLEncoding(destination: .httpBody) }
    
    public let destination: Destination
    public let arrayEncoding: ArrayEncoding
    public let boolEncoding: BoolEncoding
    
    public init(
        destination: Destination = .methodDependent,
        arrayEncoding: ArrayEncoding = .brackets,
        boolEncoding: BoolEncoding = .numeric
    ) {
        self.destination = destination
        self.arrayEncoding = arrayEncoding
        self.boolEncoding = boolEncoding
    }
    
    public func encode(_ urlRequest: URLRequest, with parameters: Parameters?) throws -> URLRequest {
        var _urlRequest = urlRequest
        guard let parameters = parameters else { return urlRequest }
        
        if let method = _urlRequest.method, destination.encodesParametersInUrl(for: method) {
            guard let url = urlRequest.url else {
                throw ApiError.parameterEncodingFailed(reason: .missingURL)
            }
            if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
            !parameters.isEmpty {
                let percentEncodedQuery = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "") + query(parameters)
                urlComponents.percentEncodedQuery = percentEncodedQuery
                _urlRequest.url = urlComponents.url
            }
            
        } else {
            _urlRequest.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            _urlRequest.httpBody = Data(query(parameters).utf8)
        }
        return _urlRequest
    }

    private func query(_ parameters: [String: Any]) -> String {
        var components: [(String, String)] = []
        
        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]!
            components += queryComponents(fromKey: key, value: value)
        }
        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
    
    public func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
        var components: [(String, String)] = []
        switch value {
        case let dictionary as [String: Any]:
            for (nestedKey, value) in dictionary {
                components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
            }
        case let array as [Any]:
            for (index, value) in array.enumerated() {
                components += queryComponents(fromKey: ArrayEncoding.brackets.encode(key: key, atIndex: index), value: value)
            }
        case let number as NSNumber:
            if number.isBool {
                components.append((escape(key), escape(BoolEncoding.numeric.encode(value: number.boolValue))))
            } else {
                components.append((escape(key), escape("\(number)")))
            }
        case let bool as Bool:
            components.append((escape(key), escape(BoolEncoding.numeric.encode(value: bool))))
        default:
            components.append((escape(key), escape("\(value)")))
        }
        return components
    }
    
    public func escape(_ string: String) -> String {
        string.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) ?? string
    }
}
