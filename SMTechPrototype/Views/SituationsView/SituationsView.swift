//
//  SituationsView.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 01/02/2023.
//

import SwiftUI

struct SituationsView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack() {
            HStack {
                VStack(alignment: .leading) {
                    Text("Good morning, John")
                        .font(.title3)
                    Text("How can we help you today?")
                        .font(.largeTitle)
                    
                    Spacer()
                }//: VStack
                .padding(.top, 70)
                Spacer()
            }//: HStack
            .padding(.horizontal, 24)
        }//: ZStack
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
