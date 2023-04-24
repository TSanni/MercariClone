//
//  ContentView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/16/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var appState = AppStateManager()
    @StateObject var recommenedVM = RecommendedViewMdel()
    @StateObject var signInUpViewModel = SignInEmailViewModel()
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    //Using this init to attempt to fix a bug where the tab bar
    //randomly becomes clear
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }


    var body: some View {
        
        TabView(selection: $appState.tabSelection) {
            
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
            .environmentObject(signInUpViewModel)
            .environmentObject(appState)
            .tabItem {
                Label("Profile", systemImage: "person")
            }
            .tag(4)

        }
        .preferredColorScheme(.light)
        .tint(.black)
        .environmentObject(appState)
        .environmentObject(recommenedVM)
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            appState.signedIn = authUser == nil ? false : true
        }
        .onChange(of: appState.tabSelection) { newValue in
            
            if newValue == 0 {
                appState.revertBackTab = 0
                print("Tab selected0: \(newValue)\n\n\n" )
                return
            }
            
            if newValue == 2 {
                appState.revertBackTab = 2
                print("Tab selected2: \(newValue)\n\n\n" )
                return
            }
            
            if !appState.signedIn && appState.tabSelection != 2 && appState.tabSelection != 0 {
                appState.showFullScreenCover = true
                appState.tabSelection = appState.revertBackTab
                print("NOT SIGNED IN")
                print("Tab selected: \(newValue)\n\n\n" )
                return
            }
            
        }
        .fullScreenCover(isPresented: $appState.showFullScreenCover) {
            OnboardingView()
                .environmentObject(appState)
                .environmentObject(signInUpViewModel)
                .environmentObject(authenticationViewModel)
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
