//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/5/21.
//

import UIKit

public protocol UIApplicationType {
  func canOpenURL(_ url: URL) -> Bool
  func open(
    _ url: URL,
    options: [UIApplication.OpenExternalURLOptionsKey: Any],
    completionHandler completion: ((Bool) -> Void)?
  )
}
