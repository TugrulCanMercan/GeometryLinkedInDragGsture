//
//  MessageViewPage.swift
//  GeometryPaging
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 30.08.2022.
//

import SwiftUI

struct ModelMessageBoxModel:Hashable {
    let personIcon: String
    let personName: String
    let shortLastMessage: String
    let lastMessageDate: String
}

struct MessageViewPage: View {
    let mockModel:[ModelMessageBoxModel] = [ModelMessageBoxModel(personIcon: "TugrulImage",
                                                                 personName: "Tuğrul Can Mercan",
                                                                 shortLastMessage: "SwiftUI HEYYOO",
                                                                 lastMessageDate: "Cuma"),
                                            ModelMessageBoxModel(personIcon: "steveJobs",
                                                                 personName: " Steve Jobs",
                                                                 shortLastMessage: "SwiftUI ve Combine öğrenmeye devam ediyorum",
                                                                 lastMessageDate: "Cuma")]
    var body: some View {
        VStack {
            
            MessageViewNavBar()
            Divider()
            Spacer()
            ScrollView {
                VStack {
                    ForEach(mockModel,id:\.self) { item in
                        HStack{
                            Image(item.personIcon)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50,height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(item.personName)
                                Text(item.shortLastMessage)
                                    .lineLimit(2)
                                
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text(item.lastMessageDate)
                                .frame(width:50,height: 50, alignment: .topTrailing)
                        }
                        .padding(.horizontal)
                        .frame(height: 70)
                        Divider()
                        
                    }
                }
                .background(.white)
            }
            .background(Color(UIColor.systemGray5))
            
            
        }
    }
}

struct MessageViewPage_Previews: PreviewProvider {
    static var previews: some View {
        MessageViewPage()
    }
}
struct MessageViewNavBar:View {
    @State var text:String = ""
    var body: some View {
        HStack {
            Image(systemName: "arrow.left")
            
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(uiColor: .systemGray5))
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField(text: $text) {
                            Text("Mesajlarda ara")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "list.bullet")
                    }
                    .padding(.horizontal)
                }
            HStack (spacing: 5){
                ForEach(0...2,id:\.self) { _ in
                    Circle()
                        .frame(width: 5, height: 5)
                }
            }
            .padding(.horizontal,6)
            Image(systemName: "square.and.pencil")
                .resizable()
                .frame(width: 20, height: 20)
            
            
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}
