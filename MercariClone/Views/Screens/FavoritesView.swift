//
//  FavoritesView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/20/23.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var vm: AppStateManager
    @State private var showFullCover = false
    
    var body: some View {
        
        
        Text("Favorites go here")
            .fullScreenCover(isPresented: $showFullCover) {
                OnboardingView()
            }
            .onAppear {
                if vm.signedIn {
                    showFullCover = false
                } else {
                    showFullCover = true
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
