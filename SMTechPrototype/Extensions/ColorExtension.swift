//
//  ColorExtension.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 27/01/2023.
//

import Foundation
import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
