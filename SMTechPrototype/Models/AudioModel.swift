//
//  AudioModel.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 30/01/2023.
//

import Foundation
import Contentful

final class AudioModel: EntryDecodable, FieldKeysQueryable {
    
    static let contentTypeId: ContentTypeId = "audio"
    
    let id: String
    let localeCode: String?
    let updatedAt: Date?
    let createdAt: Date?
    
    let name: String?
    let description: Contentful.RichTextDocument?
    
    var file: Asset?
    
    public required init(from decoder: Decoder) throws {
        let sys = try decoder.sys()
        
        id = sys.id
        localeCode = sys.locale
        updatedAt = sys.updatedAt
        createdAt = sys.createdAt
        
        let fields = try decoder.contentfulFieldsContainer(keyedBy: AudioModel.FieldKeys.self)
        self.name  = try fields.decodeIfPresent(String.self, forKey: .name)
        self.description = try fields.decodeIfPresent(Contentful.RichTextDocument.self, forKey: .description)
        
        try fields.resolveLink(forKey: .file, decoder: decoder) { [weak self] linkedFile in
            self?.file = linkedFile as? Asset
        }
    }
    
    enum FieldKeys: String, CodingKey {
        case name
        case description
        case file
    }
}
