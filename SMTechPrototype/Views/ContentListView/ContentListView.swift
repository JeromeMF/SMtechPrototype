//
//  ContentListView.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 27/01/2023.
//

import SwiftUI

struct ContentListView: View {
    // MARK: - Propertiee
    @ObservedObject var viewModel = ContentListViewModel()
    private var gridLayout = [GridItem(), GridItem()]
    
    // MARK: - Body
    var body: some View {
        ZStack() {
            VStack(spacing: 0) {
                NavigationStack {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridLayout, spacing: 8){
                                ForEach(viewModel.contentArr, id: \.id) { result in
                                    CardView(content: result)
                                }//: ForEach
                        }//: LazyVGrid
//                        .padding(.horizontal, 24)
                    }//: Scrollview
                    .navigationTitle("Content")
                }//: NavigationStack
                .padding(.horizontal, 24)
            }//: VStack
        }//: ZStack
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
        ContentListView()
    }
}
