//
//  ContenfulAPI.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 27/01/2023.
//

import Foundation
import Contentful
import Combine

class ContentfulApi {
    
    // MARK: - Properties
    private var cancellable: AnyCancellable?
    
    @Published var resArr: [ContentModel] = []
    
    // MARK: - Methods
//    func getContent() -> AnyPublisher<[ContentModel], Error> {
//        
//        var name: String = ""
//        var speakerName: String = ""
//        var fileName: String = ""
//        var fileUrl: URL = URL(string: "")!
//        
//        let client = Client(spaceId: "l2y52ttvcyxb",
//                            environmentId: "master",
//                            accessToken: "KwkW0nuFiUOwYdr-rojCv7IO7KV2-SYUiptsPypCTuQ")
//        
//        let query = Query.where(contentTypeId: "audio")
//        
//        client.fetchArray(of: Entry.self, matching: query) { result in
//            switch result {
//            case .success(let array):
//                array.items.forEach { entry in
//                    name = entry.fields["name"] as! String
//                    
//                    guard let speaker = entry.fields.linkedEntry(at: "speaker") else { return }
//                    guard let speakerNameString = speaker.fields["name"] else { return }
//                    
//                    speakerName = speakerNameString as! String
//                    
//                    //                    if let packages = entry.fields.linkedEntry(at: "package") {
//                    //                        print(packages.fields)
//                    //                    }
//                    
//                    //                    if let topics = entry.fields.linkedEntries(at: "topics") {
//                    //                        DispatchQueue.main.async {
//                    //                        }
//                    //                    }
//                    if let file = entry.fields.linkedAsset(at: "file") {
//                        fileName = file.title ?? ""
//                        fileUrl = file.url ?? URL(string: "")!
//                    }
//                    
//                    var tempContent = ContentModel(name: name,
//                                                   description: "",
//                                                   speaker: speakerName,
//                                                   situations: [],
//                                                   topics: [],
//                                                   fileTitle: fileName,
//                                                   fileUrl: fileUrl)
//                    
//                    self.resArr.append(tempContent)
//                    
//                }
//                
//                                
//            case .failure(let error):
//                print("Oh no something went wrong: \(error)")
//            }            
//        }
//            }
}
