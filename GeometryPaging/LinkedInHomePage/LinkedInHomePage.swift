//
//  LinkedInHomePage.swift
//  GeometryPaging
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 29.08.2022.
//

import SwiftUI

struct LinkedInHomePage: View {
    @State private var tabSelection: TabBarItem = .home
    init(){
        UITableView.appearance().backgroundColor = .systemGray6
    }
    
    var body: some View {
        VStack{
            
            HomeSearchBar()
           
                
            TabBarContainerView(selection: $tabSelection) {
                
                HomeCellView()
                    .tabBarItem(tab: .home, selection: $tabSelection)
                Rectangle()
                    .tabBarItem(tab: .network, selection: $tabSelection)
                Rectangle()
                    .tabBarItem(tab: .send, selection: $tabSelection)
                Rectangle()
                    .tabBarItem(tab: .notification, selection: $tabSelection)
                Rectangle()
                    .tabBarItem(tab: .jobPosting, selection: $tabSelection)
                
            }

        }
        
    }
}

struct LinkedInHomePage_Previews: PreviewProvider {
    static var previews: some View {
        LinkedInHomePage()
     
        
    }
}
//
struct HomeSearchBar:View {
    @State var searchText = ""
    @State var searchViewShow:Bool = false
    var body: some View {
        HStack {
            if searchViewShow {
                Image(systemName: "arrow.backward")
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        withAnimation {
                            searchViewShow = false

                        }
                    }
            } else {
                Image("TugrulImage")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
            }
            if searchViewShow {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(UIColor.systemGray5))
                    .frame(height: 40)
                    .overlay {
                        HStack(spacing: 8) {
                            if !searchViewShow {
                                Image(systemName: "magnifyingglass")
                            }
                            
                            TextField(text: $searchText) {
                                Text("İş ilanlarını arayın")
                                    .foregroundColor(.gray)
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                print("Textfield pressed")
                                withAnimation {
                                    searchViewShow = true
                                }
                            })
                            .onSubmit {
                                print("submit")
                                withAnimation {
                                    searchViewShow = false
                                }
                            }
                            Spacer()
                            if searchViewShow {
                                Image(systemName: "qrcode.viewfinder")
                            }
                        }
                        .frame(maxWidth: .infinity )
                   
                    }
            } else {
                
                Text("Ana Sayfa")
                    .font(.system(size: 30))
                Spacer()
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        withAnimation {
                            searchViewShow = true
                        }
                    }
            }
    
            if !searchViewShow {
                Image(systemName: "message.fill")
                    .foregroundColor(.gray)
                    .frame(width: 40, height: 40)
            }
        }
        .padding(.horizontal)
    }
}
