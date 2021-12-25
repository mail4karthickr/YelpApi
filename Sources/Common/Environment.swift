import YelpClientLive
import YelpClient
import Foundation
import UIKit

/**
 A collection of **all** global variables and singletons that the app wants access to.
 */
public struct Environment {
  /// A type that exposes endpoints for fetching Kickstarter data.
  public let apiService: YelpClient

  /// The app instance
  public let application: UIApplicationType

  /// A user defaults key-value store. Default value is `NSUserDefaults.standard`.
  public let userDefaults: KeyValueStoreType

  public init(
    apiService: YelpClient = .live,
    application: UIApplicationType = UIApplication.shared,
    userDefaults: KeyValueStoreType = UserDefaults.standard
  ) {
    self.apiService = apiService
    self.application = application
    self.userDefaults = userDefaults
  }
}
