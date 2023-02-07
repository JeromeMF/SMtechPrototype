//
//  SMTechPrototypeApp.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 27/01/2023.
//

import SwiftUI
import FirebaseCore
import Firebase
import AppboyKit
import FirebaseAnalytics

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Analytics.setAnalyticsCollectionEnabled(true) //d4eec9de-def4-4044-82f9-b04054923eb6
        
        Appboy.start(withApiKey: "d4eec9de-def4-4044-82f9-b04054923eb6", in:application, withLaunchOptions:launchOptions)
        
        return true
    }
}

@main
struct SMTechPrototypeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SituationsView()
        }
    }
}
