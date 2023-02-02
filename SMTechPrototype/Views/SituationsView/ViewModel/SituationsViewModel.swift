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
    //    private var situations: [String] = []
    private var topics: [String] = []
    private var fileName: String = ""
    private var fileUrl: URL = URL(string: "empty")!
    
    @Published var contentArray: [ContentModel] = []
    @Published var situationsArray: [SituationModel] = []
    
    // MARK: - Methods
    func getContent() {
        let client = Client(spaceId: "l2y52ttvcyxb",
                            environmentId: "master",
                            accessToken: "KwkW0nuFiUOwYdr-rojCv7IO7KV2-SYUiptsPypCTuQ")
        
        let query = Query.where(contentTypeId: "audio")
        
        var tempArr: [SituationModel] = []
        
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
                        for situation in situations {
                            if let sitName = situation.fields["name"] as? String {
                                let tempSituation = SituationModel(name: sitName)
                                
                                tempArr.append(tempSituation)
                            }
                        }
                        
                    }
                    
//                    DispatchQueue.main.async {
//                        self.situationsArr = tempArr.removingDuplicates()
//                        print("✅ \(self.situationsArr)")
//                    }
                    
//                    print("✅ \(self.situationsArr)")
                    
                    //                    if let packages = entry.fields.linkedEntry(at: "package") {
                    //                        print(packages.fields)
                    //                    }
                    
                    //                    if let topics = entry.fields.linkedEntries(at: "topics") {
                    //                        DispatchQueue.main.async {
                    //                        }
                    //                    }
                    
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
                                                   situations: self.situationsArray,
                                                   topics: [],
                                                   fileTitle: self.fileName,
                                                   fileUrl: self.fileUrl)
                    
                    
                    DispatchQueue.main.async {
                        self.situationsArray = tempArr.removingDuplicates()
                        self.contentArray.append(tempContent)
                        print("✅ \(self.situationsArray)")
                        print("🚨 \(self.contentArray)")
                    }
                    
//                    DispatchQueue.main.async {
//                        self.contentArray.append(tempContent)
//                        
//                    }
                }
            case .failure(let error):
                print("Oh no something went wrong: \(error)")
            }
            
            
        }
    }
}
