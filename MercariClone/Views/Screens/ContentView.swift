//
//  ContentView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/16/23.
//

import SwiftUI



class AppStateManager: ObservableObject {
    @Published var tabSelection = 0
    @Published var signedIn = false
}


struct ContentView: View {
    @StateObject var vm = AppStateManager()
    @StateObject var recommenedVM = RecommendedViewMdel()
    
    //Using this init to attempt to fix a bug where the tab bar
    //randomly becomes clear
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }

    
    var body: some View {
        
        TabView(selection: $vm.tabSelection) {
            
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }.tag(0)
            
            FavoritesView().tabItem {
                Label("Favorites", systemImage: "heart")
            }
            .tag(vm.signedIn ? 1 : 0)
            
            SellView().tabItem {
                Label("Sell", systemImage: "menucard")
            }
            .tag(vm.signedIn ? 2 : 0)
            
            InboxView().tabItem {
                Label("Inbox", systemImage: "bubble.middle.bottom.fill")
            }
            .tag(vm.signedIn ? 3 : 0)
            
            ProfileView().tabItem {
                Label("Profile", systemImage: "person")
            }
            .tag(vm.signedIn ? 4 : 0)

        }
        .preferredColorScheme(.light)
        .tint(.black)
        .environmentObject(vm)
        .environmentObject(recommenedVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro Max")
    }
}
