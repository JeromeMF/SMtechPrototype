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
    
    @State private var showingPlayer: Bool = false
    @State private var showingAlert: Bool = false
    
    var situation: SituationModel
    var content: [ContentModel]
    
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
                .padding(.top, 40)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: gridLayout, spacing: 8){
                        
                        ForEach(viewModel.contentDict.keys.sorted(), id: \.self) { key in
                            Section(content: {
                                ForEach(viewModel.contentDict[key]!) { content in
                                    CardView(content: content)
                                        .onTapGesture {
                                            content.premium ? showingAlert.toggle() : showingPlayer.toggle()
                                            logEvent("content-tapped", parameters: ["id": content.id, "name": content.name], type: .all)
                                        }//: OnTapGesture
                                        .sheet(isPresented: $showingPlayer) {
                                            PlayerView(content: content)
                                        }//: Sheet
                                }//: ForEach
                            }, header: {
                                HStack {
                                    Text(key)
                                        .font(.body)
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                }//: HStack header
                                .padding(.top)
                            })//: Section
                        }
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
        .alert(isPresented:$showingAlert) {
            Alert(
                title: Text("You need a premium subscription to unlock this content"),
                primaryButton: .default(Text("Subscribe")) {
                    print("Chargebee flow")
                },
                secondaryButton: .cancel()
            )
        }
    }
}

// MARK: - Preview
struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView(
            content: [],
            situation: SituationModel(name: "")
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
