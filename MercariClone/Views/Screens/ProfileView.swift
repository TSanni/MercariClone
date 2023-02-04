//
//  ProfileView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/25/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var vm: AppStateManager
    @State private var showFullCover = false

    
    var body: some View {
        
        Text("Profile goes here")
//            .fullScreenCover(isPresented: $showFullCover) {
//                OnboardingView()
//            }
//            .onAppear {
//                if vm.signedIn {
//                    showFullCover = false
//                } else {
//                    showFullCover = true
//                }
//            }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AppStateManager())
    }
}
