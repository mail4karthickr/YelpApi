import UIKit
import YelpClient

/**
 A global stack that captures the current state of global objects that the app wants access to.
 */
public struct AppEnvironment {
  /**
   A global stack of environments.
   */
  fileprivate static var stack: [Environment] = [Environment()]

  // The most recent environment on the stack.
  public static var current: Environment! {
    return stack.last
  }

  // Push a new environment onto the stack.
  public static func pushEnvironment(_ env: Environment) {
    self.stack.append(env)
  }

  // Pop an environment off the stack.
  @discardableResult
  public static func popEnvironment() -> Environment? {
    let last = self.stack.popLast()
    return last
  }

  // Replace the current environment with a new environment.
  public static func replaceCurrentEnvironment(_ env: Environment) {
    self.pushEnvironment(env)
    self.stack.remove(at: self.stack.count - 2)
  }

  // Pushes a new environment onto the stack that changes only a subset of the current global dependencies.
  public static func pushEnvironment(
    apiService: YelpClient = AppEnvironment.current.apiService,
    application: UIApplicationType = UIApplication.shared,
    userDefaults: KeyValueStoreType = AppEnvironment.current.userDefaults
  ) {
    self.pushEnvironment(
      Environment(
        apiService: apiService,
        application: application,
        userDefaults: userDefaults
      )
    )
  }

  // Replaces the current environment onto the stack with an environment that changes only a subset
  // of current global dependencies.
  public static func replaceCurrentEnvironment(
    apiService: YelpClient = AppEnvironment.current.apiService,
    application: UIApplicationType = UIApplication.shared,
    userDefaults: KeyValueStoreType = AppEnvironment.current.userDefaults
  ) {
    self.replaceCurrentEnvironment(
      Environment(
        apiService: apiService,
        application: application,
        userDefaults: userDefaults
      )
    )
  }
}
