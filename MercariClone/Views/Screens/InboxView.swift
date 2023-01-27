//
//  InboxView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/25/23.
//

import SwiftUI

struct InboxView: View {
    @EnvironmentObject var vm: AppStateManager
    @State private var showFullCover = false

    
    var body: some View {
        
        Text("Inbox goes here")
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

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
            .environmentObject(AppStateManager())
    }
}
