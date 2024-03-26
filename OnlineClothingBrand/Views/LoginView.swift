//
//  LoginView.swift
//  OnlineClothingBrand
//
//  Created by Akvasoft Pvt Ltd on 2024-03-25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginVM : LoginViewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("User Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    
                    Image(uiImage: #imageLiteral(resourceName: "logo"))
                        .resizable()
                        .frame(width: 200, height: 180)
                        .padding(.bottom, 40)
                        .padding(.top, 40)
                    
                    InputTextField(text: $loginVM.email, placeholder: "Email address")
                    
                    InputTextField(text: $loginVM.password, placeholder: "Password", isSecure: true)
                    
                    ButtonPrimary(title: "Sign In", action: {
                        loginVM.loginUser();
                    })
                    
                    NavigationLink(destination: TabView(), isActive: $loginVM.isNavigationActive) {
                        EmptyView()
                    }
                    
                    NavigationLink(destination: LoginView(), label: {
                        HStack {
                            Text("New around here?")
                                .foregroundColor(Color.black)
                            Text("Sign Up")
                                .foregroundColor(Color.blue)
                        }
                    })
                }
                .padding()
                .alert(isPresented: $loginVM.showAlert) {
                    Alert(
                        title: Text("Login Status"),
                        message: Text(loginVM.alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
