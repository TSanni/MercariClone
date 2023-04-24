//
//  SignInEmailViewModel.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/21/23.
//

import Foundation
import Firebase
@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signUp(displayName: String) async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        // Add displayName to Firebase somehow
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = displayName
        try await changeRequest?.commitChanges()
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
    
    func signOut() async throws {
        try AuthenticationManager.shared.signOut()
    }
}
