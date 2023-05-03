//
//  HomeView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/16/23.
//

import SwiftUI


struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var vm: RecommendedViewMdel
//    @EnvironmentObject var appState: AppStateManager

    @State private var searchText: String = ""
    @State private var tagGeometryEffect = 1
    @State private var showFirstTab = true
    
    @FocusState private var searchInFocus: Bool
    @State private var showSearchScreen = false
    

    
    
    var searchbarAndCartButton: some View {
        HStack {

            if showSearchScreen {
                Button {
                    withAnimation {
                        showSearchScreen = false
                        searchInFocus = false
                    }
                    searchText = ""
                } label: {
                    Image(systemName: "chevron.left")
                        .contentShape(Rectangle())
                }
                .padding(.horizontal, 5)
                .tint(colorScheme == .light ? .black : .white)
                .transition(AnyTransition.opacity)

            }

            ZStack {
                Capsule()
                    .fill(Color(hue: 0.842, saturation: 0.0, brightness: 0.954))
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)

                HStack {
                    if !searchInFocus {
                        if showSearchScreen {
                            EmptyView()
                        } else {
                            Image(systemName: "magnifyingglass")
                                .transition( AnyTransition.move(edge: .trailing).combined(with: .opacity) )
                        }


                    }
                    TextField("Search for anything", text: $searchText)
                        .focused($searchInFocus)
                        .tint(.mercariPurple)
                    

                    // if searchText is empty show empty view, otherwise, show xmark on right side of
                    // search bar
                    if searchText.isEmpty {
                        EmptyView()
                    } else {
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "xmark.circle")
                                .fontWeight(.thin)
                        }
                        .tint(.black)
                    }

                }
                .padding(.horizontal)

            }


            if !showSearchScreen {

                NavigationLink {
                    CartView()
                } label: {
                    Image(systemName: "cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }

        }
        .padding(.top)
    }
    

    
    
    var body: some View {
        
        VStack {
            
            SearchBar(usingCart: true, showSearchScreen: $showSearchScreen, searchtext: $searchText, focus: _searchInFocus)
                .padding(.top)
            
            
//            searchbarAndCartButton.padding(.horizontal)
//                .onTapGesture {
//                    withAnimation {
//                        showSearchScreen = true
//                    }
//                }
            
            if !showSearchScreen {
//                ForYouShopLocalTabsView(tagGeometryEffect: $tagGeometryEffect)
                CustomTabViews(tab1Name: "For you", tab2Name: "Shop Local", showFirstTab: $showFirstTab)
                
                if showFirstTab {
                    ForYouView()
                        .transition(.move(edge: .leading))
                } else {
                    ShopLocalView()
                        .transition(.move(edge: .trailing))
                }
            } else {
                SearchingView(searchText: $searchText, focus: _searchInFocus)
                    .transition(.opacity)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onAppear { searchInFocus = true }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.easeInOut(duration: 0.2), value: searchInFocus)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11 Pro Max")
            .environmentObject(RecommendedViewMdel())
            .environmentObject(AppStateManager())
            .preferredColorScheme(.light)
        HomeView()
            .previewDevice("iPhone 13 Pro Max")
            .environmentObject(RecommendedViewMdel())
            .environmentObject(AppStateManager())
            .preferredColorScheme(.light)


        HomeView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .environmentObject(RecommendedViewMdel())
            .environmentObject(AppStateManager())
            .preferredColorScheme(.light)


        HomeView()
            .previewDevice("iPhone SE (3rd generation)")
            .environmentObject(RecommendedViewMdel())
            .environmentObject(AppStateManager())
            .preferredColorScheme(.light)

    }
}
