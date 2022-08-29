//
//  CustomTabBarView.swift
//  SwiftUIAnimation
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 15.08.2022.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
        tabBarVersion2
            .onChange(of: selection, perform: { value in
                withAnimation(.easeInOut) {
                    localSelection = value
                }
            })
    }
    private func tabView2(tab: TabBarItem) -> some View {
        ZStack {

            VStack{
                Image(systemName: tab.iconName)
                    .font(.subheadline)
                Text(tab.title)
                    .font(.system(size: 10, weight: .semibold, design: .rounded))
            }
            .foregroundColor(localSelection == tab ? tab.color : Color.gray)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                GeometryReader { proxy in
                    if localSelection == tab {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(maxWidth: .infinity)
                            .frame(height: 2)
                        //                        .fill(tab.color.opacity(0.2))
                            .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                        
                    }
                }
            )
        }
        
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
    
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
//        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .home, .network
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}
