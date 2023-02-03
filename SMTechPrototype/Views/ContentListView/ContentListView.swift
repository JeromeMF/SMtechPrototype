//
//  ContentListView.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 27/01/2023.
//

import SwiftUI

struct ContentListView: View {
    // MARK: - Propertiee
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = ContentListViewModel()
    
    @State private var showingPlayer = false
    
    var situation: SituationModel
    var content: [ContentModel]
//    var selectedContent: ContentModel
    
    private var gridLayout = [GridItem(), GridItem()]
    
    init(content: [ContentModel], situation: SituationModel) {
        self.content = content
        self.situation = situation
    }
    
    // MARK: - Body
    var body: some View {
        ZStack() {
            NavigationStack {
                
                //                VStack(spacing: 0) {
                HStack() {
                    Image(systemName: "arrow.left")
                        .padding(.horizontal, 20)
                    Text(situation.name)
                        .font(.title)
                    Spacer()
                }
                //                    .background(Color.gray.opacity(0.5))
                .padding(.top, 40)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: gridLayout, spacing: 8){
                        ForEach(viewModel.contentArr, id: \.id) { result in
                            CardView(content: result)
                                .onTapGesture {
                                    showingPlayer.toggle()
                                }
                                .sheet(isPresented: $showingPlayer) {
                                    PlayerView(content: result)
                                }
                        }//: ForEach
                    }//: LazyVGrid
                }//: Scrollview
                .scrollIndicators(.hidden)
                //                }//: VStack
                .padding(.horizontal, 24)
                
            }//: NavigationStack
            
        }//: ZStack
        .navigationBarHidden(true)
        .toolbarBackground(.hidden, for: .navigationBar)
        .task {
            viewModel.updateContent(contentArr: content, situation: situation)
        }//: Task
        
    }
}

//struct ContentListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentListView(
//            situationTitle: "Teste"
//        )
//        .previewLayout(.sizeThatFits)
//        .padding()
//    }
//}
