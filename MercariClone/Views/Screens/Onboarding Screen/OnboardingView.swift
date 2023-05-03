//
//  OnboardingView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/18/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift


struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: AppStateManager
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        
                        Spacer()
                        
                        VStack(spacing: 15) {
                            
                            CustomTextView(textString: "Mercari")
                            
                            Text("Your Marketplace")
                        }
                        .offset(y: -50)
                        
                        Spacer()
                        
                        VStack {
                            
                            Button {
                                Task {
                                    do {
                                        try await authenticationViewModel.signInGoogle()
                                        vm.signedIn = true
                                        dismiss()
                                    } catch {
                                        print(error)
                                    }
                                }

                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke()
                                        .fill(Color.gray)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)

                                    HStack {
                                        Image("google_icon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                        Text("Continue with Google")
                                    }
                                }
                            }
                            .tint(.black)
                            
                            
//                            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
//                                Task {
//                                    do {
//                                        try await authenticationViewModel.signInGoogle()
//                                        vm.signedIn = true
//                                        dismiss()
//                                    } catch {
//                                        print(error)
//                                    }
//                                }
//                            }
                            
                            
                            
                            Button {
                                
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.blue)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .fill(Color.white)
                                                .frame(width: 30, height: 30)

                                            Image("facebook_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20, height: 20)
                                        }
                                        Text("Continue with Facebook")
                                    }
                                }
                            }
                            .tint(.white)
                            
                            Button {
                                Task {
                                    do {
                                        try await authenticationViewModel.signInApple()
                                        vm.signedIn = true
                                        dismiss()
                                    } catch {
                                        print(error)
                                    }
                                }
                            } label: {
                                SignInWithAppleButtonViewRepresentable(type: .default, style: .black)
                                    .allowsHitTesting(false)
                            }
                            .frame(height: 55)
                            
                            NavigationLink {
                                EmailSMSSignUpView(loggingIn: false)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.mercariGray)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                    Text("Continue with email")
                                        .foregroundColor(.black)
                                }
                            }

                        }
                        
                        HStack {
                            Text("Already have an account? ")
                            
                            NavigationLink {
                                EmailSMSSignUpView(loggingIn: true)
                            } label: {
                                Text("Log in")
                            }
                            .tint(Color.mercariPurple)
                            .fontWeight(.semibold)

                        }
                        .offset(y: 30)
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            Text("Learn more about Mercari").underline()
                            Text("By signing up or logging in, you agree to our ") + Text("Terms of Service").underline() + Text(" and ") + Text("Privacy Policy").underline()
                        }
                        .foregroundColor(.secondary)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        
                        
                    }
                    .frame(height: geo.size.height * 0.95)
                }
                .padding()
                .onAppear {
                    if vm.signedIn {
                        dismiss()
                        print("DISMISSING ONBOARDING VIEW")
                    }
                    print("ONBOARDING VIEW")

                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .frame(width: 30, height: 30)
                            .contentShape(Rectangle())

                    }
                    .tint(Color.black)
                    
                }
            }
        }

    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
            OnboardingView()
                .previewDevice("iPhone 11 Pro Max")
                .environmentObject(AppStateManager())
                .environmentObject(AuthenticationViewModel())
            
//        }
    }
}
