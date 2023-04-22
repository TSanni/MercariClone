//
//  MakePasswordView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/13/23.
//

import SwiftUI


struct MakePasswordView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @EnvironmentObject var appState: AppStateManager
    @State private var password: String = ""
    @Binding var email: String
    @Binding var displayName: String
    @FocusState var passwordFocus: Bool
    @Environment(\.dismiss) var dismiss


    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                passwordField
            }
            
            signUpButton

        }
        .padding()
        .onTapGesture { passwordFocus = false }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .customNavBackButton()


    }
}

//MARK: - Sub Views
extension MakePasswordView {
    private var passwordField: some View {
        VStack(alignment: .leading) {
            Text("Create a password")
            SecureField("Type your password", text: $password)
                .focused($passwordFocus)
            RoundedRectangle(cornerRadius: 0)
                .frame(height: 2)
                .foregroundColor(passwordFocus ? .mercariPurple : .mercariGray)
            
            Spacer()
            
        }
    }
    
    private var signUpButton: some View {
        Button {
            viewModel.email = email
            viewModel.password = password
            //Create the user with Firebase
            Task {
                do {
                    try await viewModel.signUp(displayName: displayName)
                    appState.signedIn = true
                    dismiss()
                    return
                } catch {
                    print(error)
                }
            }
        } label: {
            Text("Complete Sign Up")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
        }
        .disabled(invalidPassword(password: password))
        .background {
            RoundedRectangle(cornerRadius: 7)
                .fill(invalidPassword(password: password) ? Color.mercariGray : Color.mercariPurple)
            
        }

    }
}

//MARK: - Functions
extension MakePasswordView {
    func invalidPassword(password: String) -> Bool {
        if password.isEmpty { return true }
        if password.count < 5 { return true } else {
            return false
        }
    }
}

struct MakePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        MakePasswordView(email: .constant("1@2.com"), displayName: .constant("Tom"))
    }
}
