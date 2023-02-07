//
//  ViewExtension.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 06/02/2023.
//

import SwiftUI

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
