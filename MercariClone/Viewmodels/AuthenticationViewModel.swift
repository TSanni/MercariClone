//
//  AuthenticationViewModel.swift
//  FirebaseBootcamp
//
//  Created by Tomas Sanni on 4/18/23.
//

import Foundation


@MainActor
final class AuthenticationViewModel: ObservableObject {
        
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        let authDataResult = try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
//        try await UserManager.shared.createNewUser(auth: authDataResult)
//        let user = DBUser(userId: authDataResult.uid, isAnonymous: authDataResult.isAnonymous, email: authDataResult.email, photoUrl: authDataResult.photoUrl, dateCreated: Date())
//        let user = DBUser(auth: authDataResult)
//        try await UserManager.shared.createNewUser(user: user)
    }
    
    func signInApple() async throws {
        let helper = SignInAppleHelper()
        let tokens = try await helper.startSignInWithAppleFlow()
        let authDataResult = try await AuthenticationManager.shared.signInWithApple(tokens: tokens)
//        try await UserManager.shared.createNewUser(auth: authDataResult)
//        let user = DBUser(userId: authDataResult.uid, isAnonymous: authDataResult.isAnonymous, email: authDataResult.email, photoUrl: authDataResult.photoUrl, dateCreated: Date())
//        let user = DBUser(auth: authDataResult)

//        try await UserManager.shared.createNewUser(user: user)
    }
    
    func signInAnnonymously() async throws {
        let authDataResult = try await AuthenticationManager.shared.signInAnnonymous()
//        let user = DBUser(userId: authDataResult.uid, isAnonymous: authDataResult.isAnonymous, email: authDataResult.email, photoUrl: authDataResult.photoUrl, dateCreated: Date())
//        let user = DBUser(auth: authDataResult)
//
//        try await UserManager.shared.createNewUser(user: user)
       // try await UserManager.shared.createNewUser(auth: authDataResult)
    }
    
}
