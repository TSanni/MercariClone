//
//  FavoritesView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/20/23.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var vm: AppStateManager
    @State private var showSearchScreen = false
    @FocusState private var searchInFocus: Bool
    @State private var searchText: String = ""
    
    @State private var showFirstTab = true
    @Namespace var underline

    
    var body: some View {
     
        VStack {
            SearchBar(usingCart: false, showSearchScreen: $showSearchScreen, searchtext: $searchText, focus: _searchInFocus)
                .padding(.top)
            
            if !showSearchScreen {
                CustomTabViews(tab1Name: "My Likes", tab2Name: "Saved searches", showFirstTab: $showFirstTab)
            }

            ScrollView {
                if showSearchScreen {
                    SearchingView(searchText: $searchText, focus: _searchInFocus)
                } else {
                    if showFirstTab {
                        //Show likes view
                        LikeOrSearchView(showSearchScreen: $showSearchScreen, image: "shippingbox.fill", imageDescription: "No liked items", details: "Like an item and we'll let you know when the price drops", prompt: "Find something you like", searchInFocus: _searchInFocus)
                            .transition(.move(edge: .leading))
                    } else {
                        //Show saved searches
                        LikeOrSearchView(showSearchScreen: $showSearchScreen, image: "bookmark", imageDescription: "Save a search", details: "Be the first to know when an item is listed at the perfect price", prompt: "Search for something", searchInFocus: _searchInFocus)
                            .transition(.move(edge: .trailing))
                    }

                }
            }
        }

        
    }
}



struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(RecommendedViewMdel())
            .environmentObject(AppStateManager())

    }
}


