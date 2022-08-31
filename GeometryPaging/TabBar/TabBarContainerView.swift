//
//  TabBarContainerView.swift
//  SwiftUIAnimation
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 15.08.2022.
//

import SwiftUI

struct TabBarContainerView<Content:View>: View {
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    init(selection: Binding<TabBarItem> ,@ViewBuilder content: () -> Content) {
        self.content = content()
        self._selection = selection
    }
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            
                
            }
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .ignoresSafeArea()
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct TabBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarContainerView(selection: .constant(.home)) {
            Color.red
        }
    }
}

enum TabBarItem: Hashable {
    case home, network,send ,notification ,jobPosting
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .network: return "person.2"
        case .send: return "plus.square"
        case .notification: return "bell.fill"
        case .jobPosting: return "latch.2.case"
            
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Ana Sayfa"
        case .network: return "Ağım"
        case .send: return "Gönder"
        case .notification: return "Bildirimler"
        case .jobPosting: return "İş İlanları"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.gray
        case .network: return Color.gray
        case .send: return Color.gray
        case .notification: return Color.gray
        case .jobPosting: return Color.gray
        }
    }
}

