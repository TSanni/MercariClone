//
//  ContentView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/16/23.
//

import SwiftUI


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
            .navigationViewStyle(.stack)
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)
            
            
            NavigationView {
                FavoritesView()
            }
            .navigationViewStyle(.stack)
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }
            .tag(1)
            
            
            NavigationView {
                SellView()
            }
            .navigationViewStyle(.stack)
            .tabItem {
                Label("Sell", systemImage: "menucard")
            }
            .tag(2)
            
            InboxView().tabItem {
                Label("Inbox", systemImage: "bubble.middle.bottom.fill")
            }
            .tag(3)
            
            
            NavigationView {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
            .tag(4)

        }
        .preferredColorScheme(.light)
        .tint(.black)
        .environmentObject(vm)
        .environmentObject(recommenedVM)
        .onChange(of: vm.tabSelection) { newValue in
            
            if newValue == 0 {
                vm.revertBackTab = 0
                print("Tab selected0: \(newValue)\n\n\n" )
                return
            }
            
            if newValue == 2 {
                vm.revertBackTab = 2
                print("Tab selected2: \(newValue)\n\n\n" )
                return
            }
            
            if !vm.signedIn && vm.tabSelection != 2 && vm.tabSelection != 0 {
                vm.showFullScreenCover = true
                vm.tabSelection = vm.revertBackTab
                print("NOT SIGNED IN")
                print("Tab selected: \(newValue)\n\n\n" )
                return
            }
            
        }
        .fullScreenCover(isPresented: $vm.showFullScreenCover) {
            OnboardingView()
                .environmentObject(vm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro Max")
            .environmentObject(RecommendedViewMdel())
            .environmentObject(AppStateManager())
        
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
            .environmentObject(RecommendedViewMdel())
            .environmentObject(AppStateManager())
        
        ContentView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .environmentObject(RecommendedViewMdel())
            .environmentObject(AppStateManager())
    }
}
