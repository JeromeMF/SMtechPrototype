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
    
    var situationTitle: String
    private var gridLayout = [GridItem(), GridItem()]
    
    init(situationTitle: String) {
        self.situationTitle = situationTitle
    }
    
    // MARK: - Body
    var body: some View {
        ZStack() {
            NavigationStack {
                VStack(spacing: 0) {
                    HStack() {
                        Image(systemName: "arrow.left")
                            .padding(.trailing, 20)
                        Text(situationTitle)
                            .font(.title)
                        Spacer()
                    }
                    .padding(.vertical, 40)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridLayout, spacing: 8){
                            ForEach(viewModel.contentArr, id: \.id) { result in
                                CardView(content: result)
                            }//: ForEach
                        }//: LazyVGrid
                        //                        .padding(.horizontal, 24)
                    }//: Scrollview
                    .scrollIndicators(.hidden)
                    //                    .navigationTitle("Content")
                }//: NavigationStack
                .padding(.horizontal, 24)
            }//: VStack
            
        }//: ZStack
        .navigationBarHidden(true)
        .toolbarBackground(.hidden, for: .navigationBar)
        .onAppear() {
            viewModel.getContent()
            //            Task {
            //                await viewModel.getRoutines()
            //            }//: Task
        }//: OnAppear
    }
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView(
            situationTitle: "Teste"
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
