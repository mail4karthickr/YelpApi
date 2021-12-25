//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/5/21.
//

import Foundation

public enum AppKeys {
    
}

public protocol KeyValueStoreType: AnyObject {
    func set(_ value: Bool, forKey defaultName: String)
    func set(_ value: Int, forKey defaultName: String)
    func set(_ value: Any?, forKey defaultName: String)
    
    func bool(forKey defaultName: String) -> Bool
    func data(forKey defaultName: String) -> Data?
    func dictionary(forKey defaultName: String) -> [String: Any]?
    func integer(forKey defaultName: String) -> Int
    func object(forKey defaultName: String) -> Any?
    func string(forKey defaultName: String) -> String?
    func synchronize() -> Bool
    
//    var favouriteCategories: [String] { get set }
}

extension UserDefaults: KeyValueStoreType {
    
}
