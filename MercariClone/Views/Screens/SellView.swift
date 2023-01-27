//
//  SellView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/25/23.
//

import SwiftUI

struct SellView: View {
    @EnvironmentObject var vm: AppStateManager
    @State private var showFullCover = false

    
    var body: some View {
        
        Text("Items to sell go here")
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

struct SellView_Previews: PreviewProvider {
    static var previews: some View {
        SellView()
            .environmentObject(AppStateManager())
    }
}
