//
//  EmailSMSSignUpView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/26/23.
//

import SwiftUI




struct EmailSMSSignUpView: View {
    @State private var email = ""
    @State private var displayName = ""
    @State private var password = ""
    @FocusState private var emailFocus: Bool
    @FocusState private var displayNameFocus: Bool
    @FocusState private var passwordFocus: Bool
    @Environment(\.dismiss) var dismiss
    
    let loggingIn: Bool
    
    
    
    //MARK: - Main view
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(alignment: .leading) {
                    
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
                    
                    
                    VStack(alignment: .leading) {
                        
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
                        } else {
                            
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
            }
            
            
            NavigationLink {
                MakePasswordView()
            } label: {
                Text("Next")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
            .background {
                RoundedRectangle(cornerRadius: 7)
                    .fill(disableNextButton(email: email, displayName: displayName) ? Color.mercariGray : Color.mercariPurple)
                
            }
            .disabled(disableNextButton(email: email, displayName: displayName))

    

        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .customNavBackButton()
        .onTapGesture {
            emailFocus = false
            displayNameFocus = false
        }
        .onAppear {
            emailFocus = true
        }
  
    }
    
    
    
    
    
    //MARK: - Functions
    func disableNextButton(email: String, displayName: String) -> Bool {
        if email.isEmpty { return true }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: email)
        
        if displayName.count >= 3 && displayName.count <= 20 && emailPred { return false } else {
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





//MARK: - MakePasswordView
struct MakePasswordView: View {
    @State private var password: String = ""
    @FocusState var passwordFocus: Bool
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
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
            
            NavigationLink {
                Text("Hi there")
            } label: {
                Text("Next")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
            .background {
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color.mercariPurple)
                
            }
//            .disabled(disableNextButton(email: email, displayName: displayName))
        }
        .padding()
        .onTapGesture {
            passwordFocus = false
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .customNavBackButton()


    }
}

struct EmailSMSSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmailSMSSignUpView(loggingIn: true)
        }
    }
}
