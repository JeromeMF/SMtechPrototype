//
//  ContentModel.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 01/02/2023.
//

import Foundation

struct ContentModel: Identifiable, Hashable {
    var id: UUID
    var name: String
    var description: String
    var speaker: String
    var situations: [String]
    var topics: [String]
    var fileTitle: String
    var fileUrl: URL
}
