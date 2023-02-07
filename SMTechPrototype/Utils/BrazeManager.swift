//
//  BrazeManager.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 07/02/2023.
//

import AppboyKit

#if ALPHA
let BRAZE_APPKEY = "d4eec9de-def4-4044-82f9-b04054923eb6"
#else
let BRAZE_APPKEY = "d4eec9de-def4-4044-82f9-b04054923eb6"
#endif

class BrazeManager: NSObject {

    static let shared = BrazeManager()

    private let apikey = BRAZE_APPKEY

    private var appboyOptions: [String: Any] {
        return [:]
    }

    // MARK: AppDelegate proxy methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        Appboy.start(withApiKey: apikey, in: application, withLaunchOptions: launchOptions, withAppboyOptions: appboyOptions)

        registerForRemoteNotifications()
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Appboy.sharedInstance()?.registerDeviceToken(deviceToken)
    }

    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        Appboy.sharedInstance()?.register(application,
                                        didReceiveRemoteNotification: userInfo,
                                        fetchCompletionHandler: completionHandler)
    }

    private func registerForRemoteNotifications() {
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            var options: UNAuthorizationOptions = [.alert, .sound, .badge]
            if #available(iOS 12.0, *) {
                options = UNAuthorizationOptions(rawValue: options.rawValue | UNAuthorizationOptions.provisional.rawValue)
            }
            center.requestAuthorization(options: options) { (granted, _) in
                self.pushAuthorization(granted)
            }
        }

    func pushAuthorization(_ granted: Bool) {
        Appboy.sharedInstance()?.pushAuthorization(fromUserNotificationCenter: granted)
        DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
}

extension BrazeManager: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        Appboy.sharedInstance()?.userNotificationCenter(center,
                                                       didReceive: response,
                                                       withCompletionHandler: completionHandler)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
      if #available(iOS 14.0, *) {
        completionHandler([.list, .banner])
      } else {
        completionHandler([.alert])
      }
    }
}
