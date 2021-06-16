import UIKit
import Flutter
import StoreKit
import Firebase
import AppTrackingTransparency

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if #available(iOS 14, *) {
        ATTrackingManager.requestTrackingAuthorization {
            status in switch status {
            case .notDetermined:
                break
            case .restricted:
                break
            case .denied:
                break
            case .authorized:
                print("Allowed")
                break
            @unknown default:
                break
            }
        }
    }
    
    AppStoreReviewManager.requestReviewIfAppropriate()
    FirebaseApp.configure()
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


enum AppStoreReviewManager {
    static let minimumReviewWorthyActionCount = 3
    // 1.
//    var components = URLComponents(url: productURL, resolvingAgainstBaseURL: false)
//
//    // 2.
//    components?.queryItems = [
//      URLQueryItem(name: "action", value: "write-review")
//    ]
//
//    // 3.
//    guard let writeReviewURL = components?.url else {
//      return
//    }
//
//    // 4.
//    UIApplication.shared.open(writeReviewURL)
    static func requestReviewIfAppropriate() {
      let defaults = UserDefaults.standard
      let bundle = Bundle.main

      // 2.
        var actionCount = defaults.integer(forKey: String(minimumReviewWorthyActionCount) )

      // 3.
      actionCount += 1

      // 4.
      defaults.set(actionCount, forKey: String(minimumReviewWorthyActionCount))

      // 5.
      guard actionCount >= minimumReviewWorthyActionCount else {
        return
      }

      // 6.
      let bundleVersionKey = kCFBundleVersionKey as String
      let currentVersion = bundle.object(forInfoDictionaryKey: bundleVersionKey) as? String
        
        
        let lastVersion = defaults.string(forKey: String(kCFBundleVersionKey))

      // 7.
      guard lastVersion == nil || lastVersion != currentVersion else {
        return
      }

      // 8.
      SKStoreReviewController.requestReview()

      // 9.
      defaults.set(0, forKey: String(minimumReviewWorthyActionCount))
      defaults.set(currentVersion, forKey: String(kCFBundleVersionKey))
    }
}
