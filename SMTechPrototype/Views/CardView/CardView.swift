//
//  CardView.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 27/01/2023.
//

import SwiftUI

struct CardView: View {
    // MARK: - Properties
    @State var content: ContentModel
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack (alignment: .top, spacing: 0){
                    Text(content.name)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    Image(systemName: "heart")
                    
                }//: HStack
                
                Spacer()
                
                HStack(alignment: .bottom, spacing: 5) {
                    Image(systemName: "mic.fill")
                    
                    Text(content.speaker)
                        .fontWeight(.medium)
                        .font(.system(size: 14))
                        .font(.system(size: 14))
                    
                    Spacer()
                    Text("7:15")
                        .font(.caption)
                }
            }//: VStack
            .padding()
            .foregroundColor(.white)
        }//: HStack
        //        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150, alignment: .leading)
        .frame(height: 200)
        .background(Color.random.opacity(0.4))
        .cornerRadius(5.0)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 0)
        .padding(.vertical, 5)
    }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: ContentModel(id: UUID(),
                                       name: "This is a very long title that almost does not fit",
                                       description: "",
                                       speaker: "Mike",
                                       situations: [],
                                       topics: [],
                                       fileTitle: "HelixCrazy",
                                       fileUrl: URL(string: "helix")!))
        .previewLayout(.sizeThatFits)
        .frame(width: 160)
        .padding()
    }
}
