//
//  SituationsMaping.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 01/02/2023.
//

import Foundation

// MARK: - Tipes of situations
enum SituationsMapping: String {
    case preparingToSleep = "Falling asleep"
    case fallingBackToSleep = "Falling back asleep"
    case wakingUp = "Waking up"
}

//// MARK: - Types os situations description
//extension SituationsMapping: CustomStringConvertible {
//    public var description: String {
//        switch self {
//        case .preparingToSleep:
//            return "The provided url is not valid."
//        case .fallingBackToSleep:
//            return "The specified item could not be found."
//        case .wakingUp:
//            return "An unexpected error occurred."
//        }
//    }
//}
