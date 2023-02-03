//
//  PlayerView.swift
//  SMTechPrototype
//
//  Created by Jérôme Figueiredo on 03/02/2023.
//

import SwiftUI

struct PlayerView: View {
    @Namespace private var playerAnimation
    @State private var showsDetails = true
    @State private var showsControls = true
    @State var flipped: Bool = false

    @State var progress: CGFloat = 0.65
    @State var content: ContentModel

    var frame: CGFloat {
        showsDetails ? 300 : 75
    }

    var body: some View {
        ZStack {
            CardView(content: content)
                .frame(width: 300)
                .padding(.top, showsDetails ? 180 : 0)
            VStack {
                Spacer()

                VStack {
                    HStack {
    //                    CardView(content: ContentModel(id: UUID(), name: "Test", description: "", speaker: "Sascha", situations: [], topics: [], fileTitle: "Yo", fileUrl: URL(string: "s")!))
                        Image("cover")
                            .resizable()
                            .frame(width: frame, height: frame)
                            .padding(.top, showsDetails ? 180 : 0)
                            .rotation3DEffect(
                                flipped ? Angle(degrees: 180) : .zero,
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                            .animation(.default, value: flipped)
                            .onTapGesture {
                                flipped.toggle()
                            }

                        if !showsDetails {
                            VStack(alignment: .leading) {
                                Text(content.name)
                                    .foregroundColor(.white)

                                Text(content.speaker)
                                    .foregroundColor(.gray)
                            }
                            .font(.title2)
                            .matchedGeometryEffect(id: "AlbumTitle", in: playerAnimation)


                            Spacer()

                            Image(systemName: "play.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .padding()
                        }
                    }

                    if showsDetails {
                        Spacer()
                            .frame(height: 44)

                        HStack {
                            Spacer()
                                .frame(width: 44)

                            VStack(alignment: .leading) {
                                Text(content.name)
                                    .foregroundColor(.white)

                                Text(content.speaker)
                                    .foregroundColor(.gray)
                            }
                            .font(.title2)
                            .matchedGeometryEffect(id: "AlbumTitle", in: playerAnimation)

                            Spacer()
                        }

                        VStack {
                            ProgressBarView(initialProgress:$progress, color: .white)
                                .frame(height: 8)
                                .padding([.leading, .trailing], 44)

                            HStack {
    //                            Image(systemName: "arrow.left.to.line.alt")
    //                                .font(.system(size: 30))
    //                                .foregroundColor(.white)
    //                                .padding()

                                Image(systemName: "play.circle.fill")
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                                    .padding()

    //                            Image(systemName: "arrow.right.to.line.alt")
    //                                .font(.system(size: 30))
    //                                .foregroundColor(.white)
    //                                .padding()
                            }
                        }.opacity(showsControls ? 1 : 0)
    //                    .animation(.easeIn)
                        Spacer()
                    }
                }
                .onTapGesture {
                    showsControls.toggle()
                    Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { timer in
                        withAnimation(.spring()) {
                            self.showsDetails.toggle()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: showsDetails ? UIScreen.screenHeight + 44 : 75)
                .background(darkGray)
            }
        }//: ZStack
        .background(.black)
    }
}

//struct MusicPlayerContentView: View {
//
//    var body: some View {
//        ZStack {
//            darkBlack
//                .edgesIgnoringSafeArea(.all)
//
//            PlayerView()
//        }
//    }
//}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(content: ContentModel(id: UUID(),
                                         name: "This is a very long title that almost does not fit",
                                         description: "",
                                         speaker: "Mike",
                                         situations: [],
                                         topics: [],
                                         fileTitle: "HelixCrazy",
                                         fileUrl: URL(string: "helix")!))
    }
}
