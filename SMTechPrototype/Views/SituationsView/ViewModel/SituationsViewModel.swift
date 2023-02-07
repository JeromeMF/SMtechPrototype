//
//  SituationsViewModel.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 01/02/2023.
//

import Foundation
import SwiftUI
import Contentful
import Combine

class SituationsViewModel: ObservableObject {
    
    // MARK: - Properties
    private var name: String = ""
    private var description: String = ""
    private var speaker: String = ""
    private var topics: [String] = []
    private var fileName: String = ""
    private var fileUrl: URL = URL(string: "empty")!
    private var premium: Bool = false
    
    @Published var contentArray: [ContentModel] = []
    @Published var situationsArray: [SituationModel] = []
    
    // MARK: - Methods
    func getContent() {
        let client = Client(spaceId: "l2y52ttvcyxb",
                            environmentId: "master",
                            accessToken: "KwkW0nuFiUOwYdr-rojCv7IO7KV2-SYUiptsPypCTuQ")
        
        let query = Query.where(contentTypeId: "audio")
        
        var tempArr: [SituationModel] = []
        var tempArr2: [SituationModel] = []
        var techniquesArr: [TechniqueModel] = []
        
        client.fetchArray(of: Entry.self, matching: query) { result in
            
            switch result {
            case .success(let array):
                array.items.forEach { entry in
                    
                    if let name = entry.fields["name"] as? String {
                        self.name = name
                    }
                    
                    if let description = entry.fields["description"] as? String {
                        self.description = description
                    }
                    
                    if let speaker = entry.fields.linkedEntry(at: "speaker") {
                        if let speakerName = speaker.fields["name"]  {
                            self.speaker = speakerName as! String
                        }
                    }
                    
                    if let situations = entry.fields.linkedEntries(at: "situations") {
                        situations.forEach { entry in
                            if let sitName = entry.fields["name"] as? String {
                                tempArr.append(SituationModel(name: sitName))
                                tempArr2.append(SituationModel(name: sitName))
                            }
                        }
                    }
                    
                    if let premium = entry.fields["premium"] as? Bool {
                        self.premium = premium
                    }
                    
                    //                    if let packages = entry.fields.linkedEntry(at: "package") {
                    //                        print(packages.fields)
                    //                    }
                    
                    if let techniques = entry.fields.linkedEntries(at: "techniques") {
                        techniques.forEach { entry in
                            if let techName = entry.fields["name"] as? String {
                                techniquesArr.append(TechniqueModel(name: techName))
                            }
                        }
                    }
                    
                    if let file = entry.fields.linkedAsset(at: "file") {
                        self.fileName = file.title ?? ""
                        
                        if let url = file.url {
                            self.fileUrl = url
                        }
                    }
                    
                    let tempContent = ContentModel(id: UUID(),
                                                   name: self.name,
                                                   description: "",
                                                   speaker: self.speaker,
                                                   situations: tempArr,
                                                   topics: [],
                                                   techniques: techniquesArr,
                                                   fileTitle: self.fileName,
                                                   fileUrl: self.fileUrl,
                                                   premium: self.premium)
                    
                    
                    DispatchQueue.main.async {
                        self.situationsArray = tempArr2.removingDuplicates()
                        self.contentArray.append(tempContent)
                        //                        print("✅ \(self.situationsArray)")
                        //                        print("🔥 \(tempContent.situations) \(tempContent.situations.count)")
                        //                        print("🚨 \(self.contentArray)")
                    }
                    
                    tempArr.removeAll()
                    techniquesArr.removeAll()
                }
            case .failure(let error):
                print("Oh no something went wrong: \(error)")
            }
        }
    }
}
