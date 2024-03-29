//
//  SignupView.swift
//  OnlineClothingBrand
//
//  Created by Akvasoft Pvt Ltd on 2024-03-26.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var loginVM : LoginViewModel = LoginViewModel()
    
    @StateObject var coordinator = Coordinator()
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                Text("User Registration")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                Image(uiImage: #imageLiteral(resourceName: "logo"))
                    .resizable()
                    .frame(width: 170, height: 170)
                    .padding(.bottom, 10)
                    .padding(.top, 10)

                
                InputTextField(text: $loginVM.fullName, placeholder: "Full name")
                
                InputTextField(text: $loginVM.email, placeholder: "Email address")
                
                InputTextField(text: $loginVM.password, placeholder: "Password", isSecure: true)
                
                InputTextField(text: $loginVM.confirmPassword, placeholder: "Confirm Password", isSecure: true)
                
                ButtonPrimary(title: "Sign Up", action: {
                    // Action to perform when the button is tapped
                    loginVM.registerUser(){
                        
                        result in
                        
                        switch result {
                        case .success(_):
                            
                            coordinator.navigate(to: .login)
                        
                        case .failure(let error):
                            loginVM.errorMessage = error.errorMessage
                        }
                        
                    }
                    
                })

                Text("or sign in using below social logins")
                    .foregroundColor(Color.black.opacity(0.6))
                    .font(.callout)
                    .padding(.top, 10)
                
                SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "AppleLogo")), text: Text("Sign in with Apple"))
                
                SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "GoogleLogo")), text: Text("Sign in with Google"))
                    .padding(.vertical, 10)
            }
            .padding()
//            .alert(isPresented: $showAlert) {
//                Alert(
//                    title: Text(alertTitle),
//                    message: Text(registrationStatus),
//                    dismissButton: .default(Text("OK"))
//                )
//            }
        }
    }
}

#Preview {
    SignupView()
}


struct SocialLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        VStack {
            HStack {
                image
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
                Spacer()
                text
                    .font(.title2)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(50.0)
            .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 0.0)
        }
        .padding(.bottom, -15)
    }
}
