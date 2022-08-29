//
//  LinkedInSideBar.swift
//  GeometryPaging
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 29.08.2022.
//

import SwiftUI

struct LinkedInSideBar: View {
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                Image("TugrulImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                Text("Tuğrul Can MERCAN")
                    .font(.system(size: 25))
                
                Button {
                    
                } label: {
                    Text("Profil Görüntüle")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            Divider()
            
            VStack(alignment: .leading, spacing:16){
                Button {
                    
                } label: {
                    Text("Gruplar")
                        .foregroundColor(Color(UIColor(#colorLiteral(red: 0.2807199537, green: 0.2807199537, blue: 0.2807199537, alpha: 1))))
                        .font(.system(size: 20))
                }
                Button {
                    
                } label: {
                    Text("Etkinlikler")
                        .foregroundColor(Color(UIColor(#colorLiteral(red: 0.2807199537, green: 0.2807199537, blue: 0.2807199537, alpha: 1))))
                        .font(.system(size: 20))
                }
            }
            .padding()
            Spacer()
            Divider()
            VStack(alignment: .leading,spacing:16){
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "square.fill")
                            .tint(.yellow)
                        Text("Premium Ücretsiz yaptım :)")
                            .foregroundColor(Color(UIColor(#colorLiteral(red: 0.2807199537, green: 0.2807199537, blue: 0.2807199537, alpha: 1))))
                            .font(.system(size: 20))
                    }
                }
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "gear")
                            .tint(.black)
                        Text("Ayarlar")
                            .foregroundColor(Color(UIColor(#colorLiteral(red: 0.2807199537, green: 0.2807199537, blue: 0.2807199537, alpha: 1))))
                            .font(.system(size: 20))
                    }
                }
            }
            .padding()
        }
    }
}

struct LinkedInSideBar_Previews: PreviewProvider {
    static var previews: some View {
        LinkedInSideBar()
    }
}
