//
//  InboxView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/25/23.
//

import SwiftUI

struct InboxView: View {
    @EnvironmentObject var vm: AppStateManager
    @State private var showFirstTab = true
    @State private var showSearchScreen = false
    @State var searchText = ""
    
    var body: some View {
        
        VStack {
            CustomTabViews(tab1Name: "Notifications", tab2Name: "Messages", showFirstTab: $showFirstTab)
            
            ScrollView {
                if showFirstTab {
                    CustomTabViewContent(showSearchScreen: $showSearchScreen, image: "bell", imageDescription: "Let's get started", details: "Get updates on your favorite items and Mercari news", prompt: nil)
                        .transition(.move(edge: .leading))

                } else {
                    if showSearchScreen {
                        VStack {
                            SearchBar(usingCart: false, showSearchScreen: $showSearchScreen, searchtext: $searchText)
                            SearchingView(searchText: $searchText)
                        }

                    } else {
                        CustomTabViewContent(showSearchScreen: $showSearchScreen, image: "message", imageDescription: "Start chatting", details: "You'll find your offers and chats right here", prompt: "Search for something")
                            .transition(.move(edge: .trailing))
                    }
                }
            }
        }
        
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
            .environmentObject(AppStateManager())
    }
}
