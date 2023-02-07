//
//  ContentListViewModel.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 27/01/2023.
//

import Foundation
import SwiftUI
import Contentful
import Combine

class ContentListViewModel: ObservableObject {
    
    // MARK: - Properties
    private var name: String = ""
    private var description: String = ""
    private var speaker: String = ""
    private var situations: [String] = []
    private var topics: [String] = []
    private var fileName: String = ""
    private var fileUrl: URL = URL(string: "empty")!
    
    @Published var contentArr: [ContentModel] = []
    @Published var situationsArr: [SituationsMapping] = []
    @Published var contentDict: [String: [ContentModel]] = [:]
    
    // MARK: - Methods
    func updateContent(contentArr: [ContentModel], situation: SituationModel) {
        
        DispatchQueue.main.async {
            self.contentArr = contentArr.filter { $0.situations.contains(situation) }
            self.contentDict = Dictionary(grouping: self.contentArr, by: { $0.techniques.first!.name as String })
        }
        
    }
    
    func groupContent(contentArr: [ContentModel]) {
        DispatchQueue.main.async {
            self.contentDict = Dictionary(grouping: contentArr, by: { $0.techniques.first!.name as String })
        }
        
    }
}
