//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/4/21.
//

import Foundation

extension URLRequest {
    /// Returns the `httpMethod` as Alamofire's `HTTPMethod` type.
    public var method: HTTPMethod? {
        get { httpMethod.flatMap { val in HTTPMethod(rawValue: val) } }
        set { httpMethod = newValue?.rawValue }
    }
}
