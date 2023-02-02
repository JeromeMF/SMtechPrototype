//
//  SituationsView.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 01/02/2023.
//

import SwiftUI

struct SituationsView: View {
    // MARK: - Properties
    @ObservedObject var viewModel = SituationsViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack() {
            NavigationStack() {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Good morning, John")
                            .font(.title3)
                        Text("How can we help you today?")
                            .font(.largeTitle)
                        
                        ForEach(viewModel.situationsArray, id:\.self) { situation in
                            NavigationLink(destination: ContentListView(content: viewModel.contentArray, situation: situation),
                                           label: {
                                HStack() {
                                    Spacer()
                                    Text(situation.name)
                                    Spacer()
                                }
                                .frame(height: 100)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            })
                        }//: ForEach
                        
                        Spacer()
                    }//: VStack
                    .padding(.top, 70)
                    Spacer()
                }//: HStack
                .padding(.horizontal, 24)
            }
        }//: ZStack
        .task {
            viewModel.getContent()
        }
    }
}

// MARK: - Preview
struct SituationsView_Previews: PreviewProvider {
    static var previews: some View {
        SituationsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
