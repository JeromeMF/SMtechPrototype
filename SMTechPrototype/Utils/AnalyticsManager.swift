//
//  AnalyticsManager.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 06/02/2023.
//

import Foundation

enum AnalyticsSystems: String, CaseIterable {
    case firebase
    case braze
    case all
}

// MARK: - Log event
// Log an event on any of the available systems
func logEvent(_ name: String, parameters: [String: Any] = [:], types: [AnalyticsSystems] = AnalyticsSystems.allCases) {
    print("++++++++ NEW EVENT: \(name) - \(parameters)")
    for type in types {
        logEvent(name, parameters: parameters, type: type)
    }
}

func logEvent(_ name: String, parameters: [String: Any], type: AnalyticsSystems) {
    switch type {
    case .firebase:
        //        Analytics.logEvent(name, parameters: parameters)
        print("Firebase log event: \(name) \(type)")
    case .braze:
        // Appboy.sharedInstance()?.logCustomEvent(name, withProperties: parameters)
        print("Braze log event: \(name) \(type)")
        break
        
    case .all:
        print("All analytics log event: \(name) \(type)")
        break
    }
}

// Log a screenview event
// Use example:
/*
 .onAppear(perform: {
 logScreenView(screenName: "ClassDetails")
 })
 */
//func logScreenView(screenName: String) {
// print("++++++++++++ Analytics Screen View event sent: \(screenName)")
//    Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName: screenName])
//}
