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
        ZStack(alignment: .bottom) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
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

public enum TabBarItem: Hashable {
    case home, network, profile, messages
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .network: return "person.2"
        case .profile: return "person"
        case .messages: return "message"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .network: return "person.2"
        case .profile: return "Profile"
        case .messages: return "Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.gray
        case .network: return Color.gray
        case .profile: return Color.gray
        case .messages: return Color.gray
        }
    }
}
