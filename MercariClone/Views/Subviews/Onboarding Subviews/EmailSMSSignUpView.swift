//
//  EmailSMSSignUpView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/26/23.
//

import SwiftUI




struct EmailSMSSignUpView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @State private var email = ""
    @State private var displayName = ""
    @State private var password = ""
    @FocusState private var emailFocus: Bool
    @FocusState private var displayNameFocus: Bool
    @FocusState private var passwordFocus: Bool
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppStateManager
    let loggingIn: Bool
    

    
    
    //MARK: - Main view
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(alignment: .leading) {
                    emailField
                    passwordField
                }
            }
            
            navLinkToNextPage
                .disabled(disable)
                .background {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(disable ? Color.mercariGray : Color.mercariPurple)
                }
        }
        .environmentObject(viewModel)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .customNavBackButton()
        .onAppear { emailFocus = true }
        .onAppear {
            if appState.signedIn { dismiss() }
        }
        .onTapGesture {
            emailFocus = false
            displayNameFocus = false
        }
    }
}


//MARK: - Sub Views
extension EmailSMSSignUpView {
    
    private var emailField: some View {
        //Email group
        VStack(alignment: .leading) {
            Text("Email address")
                .foregroundColor(blankOrValidEmail(email: email) ? nil : emailFocus ? nil : .red)
                .fontWeight(.semibold)
            TextField("Enter email address", text: $email)
                .keyboardType(.emailAddress)
                .tint(.mercariPurple)
                .focused($emailFocus)
                .onSubmit {
                    emailFocus = false
                    
                    if loggingIn { passwordFocus = true } else {
                        displayNameFocus = true
                    }
                }
            RoundedRectangle(cornerRadius: 0)
                .frame(height: 2)
                .foregroundColor(emailFocus ? .mercariPurple : blankOrValidEmail(email: email) ? .secondary : .red)

            if !emailFocus && !blankOrValidEmail(email: email) {
                Text("Email must be in format: example@example.com")
                    .foregroundColor(.red)
                    .font(.footnote)
            }
        }.padding(.bottom)
        
        
    }
    
    private var passwordField: some View {
        VStack(alignment: .leading) {
            
            //If logging in, get password and continue signin
            if loggingIn {
                Text("Password")
                    .foregroundColor(blankOrValidPassword(password: password) ? nil : passwordFocus ? nil : .red)
                    .fontWeight(.semibold)
                SecureField("", text: $password)
                    .keyboardType(.emailAddress)
                    .tint(.mercariPurple)
                    .focused($passwordFocus)
                RoundedRectangle(cornerRadius: 0)
                    .frame(height: 2)
                    .foregroundColor(passwordFocus ? .mercariPurple : blankOrValidPassword(password: password) ? .secondary : Color.red)
                
                if !passwordFocus && !blankOrValidPassword(password: password) {
                    Text("Invalid password")
                        .foregroundColor(.red)
                        .font(.footnote)
                }
            } else { // If signing up, get displayName and continue to MakePasswordView
                Text("Display name")
                    .foregroundColor(blankOrValidDisplayName(displayname: displayName) ? nil : displayNameFocus ? nil : .red)
                    .fontWeight(.semibold)
                TextField("3-20 character display name", text: $displayName)
                    .keyboardType(.emailAddress)
                    .tint(.mercariPurple)
                    .focused($displayNameFocus)
                RoundedRectangle(cornerRadius: 0)
                    .frame(height: 2)
                    .foregroundColor(displayNameFocus ? .mercariPurple : blankOrValidDisplayName(displayname: displayName) ? .secondary : Color.red)
                
                if !displayNameFocus && !blankOrValidDisplayName(displayname: displayName) {
                    Text("Display name must be 3-20 characters")
                        .foregroundColor(.red)
                        .font(.footnote)
                }
            }
        }
    }
    
    private var navLinkToNextPage: some View {
        Group {
            if loggingIn {
                Button {
                    // Log in with firebase then dismiss
                    viewModel.email = email
                    viewModel.password = password
                    Task {
                        try await viewModel.signIn()
                        appState.signedIn = true
                        dismiss()
                    }
        
                } label: {
                    Text("Log in")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                }
            } else {
                // Signing up
                NavigationLink {
                    MakePasswordView(email: $email, displayName: $displayName)
                        .environmentObject(viewModel)

                } label: {
                    Text("Next")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
    }
    
}


//MARK: - Functions
extension EmailSMSSignUpView {
    
    //MARK: - Get results of disableNextButton
    var disable: Bool {
        return disableNextButton(email: email, displayName: displayName, usingPassword: loggingIn, password: password)
    }
    
    func disableNextButton(email: String, displayName: String, usingPassword: Bool, password: String) -> Bool {
        if email.isEmpty { return true }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: email)
        if usingPassword && password.isEmpty { return true }
        if usingPassword && password.count >= 7 { return false }

        if !usingPassword && displayName.count >= 3 && displayName.count <= 20 && emailPred && usingPassword == false { return false } else {
            return true
        }
        
    }
    
    func blankOrValidEmail(email: String) -> Bool {
        
        if email.isEmpty { return true }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: email)
        
        return emailPred
    }
    
    func blankOrValidDisplayName(displayname: String) -> Bool {
        
        if displayname.isEmpty { return true }
        
        if displayName.count >= 3 && displayName.count <= 20 { return true } else {
            return false
        }
    }
    
    func blankOrValidPassword(password: String) -> Bool {
        
        if password.isEmpty { return true }
        
        if password.count < 5 { return false } else {
            return true
        }
    }
}




struct EmailSMSSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmailSMSSignUpView(loggingIn: false)
                .environmentObject(AppStateManager())
        }
    }
}
