
//  HomeCellView.swift
//  GeometryPaging
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 29.08.2022.
//

import SwiftUI


struct CellModel: Identifiable {
    var id  = UUID().uuidString
    
    let header:HeaderModel
    let content: CellContent
}
struct CellContent {
    let contentImage: String
    let likedIconCount: String
    let commentCount: Int
    let shareCount: Int
}

struct HeaderModel {
    let headerImage:String
    let headerTitle:String
    let headerFollowers: String
    let lastPostDate:Int
    
    let description:String
}

struct HomeCellView: View {
    let minimumHeightPost:CGFloat =  UIScreen.main.bounds.height / 4
    let screenWidth: CGFloat =  UIScreen.main.bounds.width
    let mockContent:[CellModel] = [CellModel(header: HeaderModel(headerImage: "vakıfBank",
                                                                 headerTitle: "VakıfBank",
                                                                 headerFollowers: "70.174",
                                                                 lastPostDate: 3,
                                                                 description: "1954 yılında, vakıf kaynaklarını ekonomik kalkınmanın gereksinimleri doğrultusunda en iyi biçimde değerlendirmek amacıyla kurulan VakıfBank, o günden bu yana çağdaş bankacılık yöntemleri ve uygulamalarıyla Türkiye’nin tasarruf düzeyinin gelişim sürecine katkıda bulunmaktadır. VakıfBank; bölgesinin en iyi, en çok t"),
                                             content: CellContent(contentImage: "ks8Docker",
                                                                  likedIconCount: "100",
                                                                  commentCount: 5,
                                                                  shareCount: 5)),
                                   CellModel(header: HeaderModel(headerImage: "Apple",
                                                                 headerTitle: "Apple",
                                                                 headerFollowers: "500.000",
                                                                 lastPostDate: 3,
                                                                 description: "Hepimizin sevdiğimiz şeyi yeni yollarla yapmamıza yardımcı olmak için neyin mümkün olduğunu sürekli olarak yeniden tasavvur eden çok çeşitli bir düşünürler ve uygulayıcılar topluluğuyuz. Ve ürünlerimize giren aynı yenilik, uygulamalarımız için de geçerlidir - dünyayı bulduğumuzdan daha iyi bırakma taahhüdümüzü güçlendiriyor. Bu, işinizin insanların yaşamlarında bir fark yaratabileceği yerdir. Kendiniz dahil."
                                                                ),
                                             content: CellContent(contentImage: "SwiftUIIcon",
                                                                  likedIconCount: "99",
                                                                  commentCount: 5,
                                                                  shareCount: 5))]
    var body: some View {
        VStack {
                ScrollView {
                    
                    ForEach(mockContent) { item in
                        
                        
                        VStack {
                            HomeCellHeader(headerModel:  item.header)
                            Image(item.content.contentImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: minimumHeightPost)
                                .padding(.horizontal)
                            HStack {
                                ZStack {
                                    ImageOnCircle(icon:  "hand.thumbsup.fill", radius: 8, circleColor: .blue, imageColor: .white)
                                    ImageOnCircle(icon:  "person", radius: 8, circleColor: .green, imageColor: .white)
                                        .offset(x: 12)
                                    Image(systemName: "heart.circle.fill")
                                        .offset(x:24)
                                }
                                
                                Text(item.content.likedIconCount)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                Spacer()
                                HStack {
                                    Button {
                                        
                                    } label: {
                                        Text("\(item.content.commentCount) yorum")
                                            .foregroundColor(.gray)
                                    }
                                    Circle()
                                        .fill(.gray)
                                        .frame(width: 3, height: 3)
                                    
                                    Button {
                                        
                                    } label: {
                                        Text("\(item.content.shareCount) paylaşım")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .lineLimit(0)
                                .minimumScaleFactor(0.6)
                                .frame(width: screenWidth / 2.5)
                                
                                
                            }
                            .padding(.horizontal)
                            Divider()
                            HStack {
                                VStack {
                                    Image(systemName: "hand.thumbsup")
                                    Text("Beğen")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                VStack {
                                    Image(systemName: "message")
                                    Text("Beğen")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                VStack {
                                    Image(systemName: "arrow.turn.up.right")
                                    Text("Beğen")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                VStack {
                                    Image(systemName: "paperplane.fill")
                                        .foregroundColor(.gray)
                                    Text("Beğen")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            
                            
                        }
                        .background(.white)
                    }
                   
                }
                .background(Color(uiColor: .systemGray6))
            
           
            
            
            
            
            
        }
    }
}
struct ImageOnCircle: View {
    
    let icon: String
    let radius: CGFloat
    let circleColor: Color
    let imageColor: Color // Remove this for an image in your assets folder.
    var squareSide: CGFloat {
        2.0.squareRoot() * radius
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .frame(width: radius * 2.5, height: radius * 2.5)
            
            
            Circle()
                .fill(circleColor)
                .frame(width: radius * 2, height: radius * 2)
            
            
            // Use this implementation for an SF Symbol
            Image(systemName: icon)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: squareSide, height: squareSide)
                .foregroundColor(imageColor)
            
            // Use this implementation for an image in your assets folder.
            //            Image(icon)
            //                .resizable()
            //                .aspectRatio(1.0, contentMode: .fit)
            //                .frame(width: squareSide, height: squareSide)
        }
    }
}
struct HomeCellHeader:View {
    let headerModel:HeaderModel
    @State var showReadMore:Bool = false
    init(headerModel:HeaderModel) {
        self.headerModel = headerModel
    }
    
    var body: some View {
        VStack{
            HStack{
                Image(headerModel.headerImage)
                    .resizable()
                    .frame(width: 70 ,height: 70)
                VStack(alignment: .leading){
                    Text("VakıfBank")
                        .bold()
                    Text("\(headerModel.headerFollowers) takipçi")
                        .lineLimit(0)
                        .minimumScaleFactor(0.5)
                    HStack(spacing: 5) {
                        Text("\(headerModel.lastPostDate) saat")
                        Circle()
                            .frame(width: 3, height: 3)
                        Image(systemName: "network")
                    }
                    
                }
                .frame(width: 90)
                Spacer()
                HStack (spacing: 5){
                    ForEach(0...2,id:\.self) { _ in
                        Circle()
                            .frame(width: 5, height: 5)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .topTrailing)
                
                
            }
            .frame(maxHeight: 70)
            .padding()
            
            VStack {
                Text(headerModel.description)
                    .lineLimit(showReadMore ? nil : 5)
                    .minimumScaleFactor(0.8)
                    .onTapGesture {
                        withAnimation {
                            showReadMore.toggle()
                        }
                    }
                Text(!showReadMore ? "...daha fazla" : "")
                    .padding(.trailing)
                    .frame(maxWidth : .infinity,alignment: .trailing)
            }
            .padding(.horizontal)
            
            
        }
    }
}

struct HomeCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeCellView()
    }
}
