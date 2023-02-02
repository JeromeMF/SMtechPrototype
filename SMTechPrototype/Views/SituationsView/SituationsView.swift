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
            HStack {
                VStack(alignment: .leading) {
                    Text("Good morning, John")
                        .font(.title3)
                    Text("How can we help you today?")
                        .font(.largeTitle)
                    
                    ForEach(viewModel.situationsArr, id:\.self) { situation in
                        Button(action: {
                            
                        }, label: {
                            HStack() {
                                Spacer()
                                Text(situation.name)
                                Spacer()
                            }
                            .frame(height: 100)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            //                        .border(Color.gray)
                            .cornerRadius(10)
                            
                        })
                        
                    }
                    
//                    Button(action: {
//
//                    }, label: {
//                        HStack() {
//                            Spacer()
//                            Text(SituationsMapping.preparingToSleep.rawValue)
//                            Spacer()
//                        }
//                        .frame(height: 100)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        //                        .border(Color.gray)
//                        .cornerRadius(10)
//
//                    })
//
//                    Button(action: {
//
//                    }, label: {
//                        HStack() {
//                            Spacer()
//                            Text(SituationsMapping.fallingBackToSleep.rawValue)
//                            Spacer()
//                        }
//                        .frame(height: 100)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        //                        .border(Color.gray)
//                        .cornerRadius(10)
//
//                    })
//
//                    Button(action: {
//
//                    }, label: {
//                        HStack(){
//                            Spacer()
//                            Text(SituationsMapping.wakingUp.rawValue)
//                            Spacer()
//                        }
//                        .frame(height: 100)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        //                        .border(Color.gray)
//                        .cornerRadius(10)
//                    })
                    
                    Spacer()
                }//: VStack
                .padding(.top, 70)
                Spacer()
            }//: HStack
            .padding(.horizontal, 24)
        }//: ZStack
        .onAppear() {
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
