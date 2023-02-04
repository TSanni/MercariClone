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
    @Published var showFullScreenCover = false
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
            
            
            NavigationView {
                FavoritesView()
            }
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }
            .tag(1)
            
            
            NavigationView {
                SellView()
            }
            .tabItem {
                Label("Sell", systemImage: "menucard")
            }
            .tag(2)
            
            InboxView().tabItem {
                Label("Inbox", systemImage: "bubble.middle.bottom.fill")
            }
            .tag(3)
            
            ProfileView().tabItem {
                Label("Profile", systemImage: "person")
            }
            .tag(4)

        }
        .preferredColorScheme(.light)
        .tint(.black)
        .environmentObject(vm)
        .environmentObject(recommenedVM)
        .onChange(of: vm.tabSelection) { newValue in
            
            if !vm.signedIn && vm.tabSelection != 2 && vm.tabSelection != 0 {
                vm.showFullScreenCover = true
                
                vm.tabSelection = 0
            }
            
            print("Tab selected: \(newValue)\n\n\n" )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro Max")
    }
}
