//
//  SettingsView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/23/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vm: SignInEmailViewModel
    @EnvironmentObject var appState: AppStateManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        
        VStack {
            
            Text("Account Settings")
            List {
                
                Button("Log out") {
                    print("Log out pressed")
                    Task {
                        try await vm.signOut()
                        appState.signedIn = false
                        appState.tabSelection = 0
                        dismiss()
                        
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(SignInEmailViewModel())
    }
}
