//
//  SignupView.swift
//  OnlineClothingBrand
//
//  Created by Akvasoft Pvt Ltd on 2024-03-26.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var loginVM : LoginViewModel = LoginViewModel()
    
    @EnvironmentObject var coordinator : Coordinator
    var body: some View {
        NavigationView {
            
            ZStack {
                
                //            Color.secondary.opacity(0.2).ignoresSafeArea(edges : .top)
                
                VStack{
                    
                    VStack() {
                        
                        Image("signup")
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                    }.padding()
                    
                    VStack{
                        Text("Sign Up").font(.system(size: 36)) // Set the font size
                            .foregroundColor(Color("loginfontone")) // Set the font color
                            .fontWeight(.bold)
                    }.padding()
                    VStack{
                        Text("Create your account").font(.system(size: 20)) // Set the font size
                            .foregroundColor(Color("loginfontone"))// Set the font color
                            .fontWeight(.light)
                        
                        
                    }
                    
                    
                    
                    VStack{
                        
                        VStack{
                            
                            
                            TextField("Email", text: $loginVM.email)  .autocapitalization(.none)
                                .frame(height: 40)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.horizontal], 10)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                .padding([.horizontal], 10).background(Color("TextColour")).border(Color("TextColour"))
                        }
                        
                        
                        
                        
                        VStack{
                            
                            
                            TextField("Password", text: $loginVM.password)  .autocapitalization(.none)
                                .frame(height: 40)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.horizontal], 10)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                .padding([.horizontal], 10).background(Color("TextColour")).border(Color("TextColour"))
                        }.padding([.vertical], 10)
                        
                        VStack{
                            
                            
                            TextField("Concirm Password", text: $loginVM.confirmPassword)  .autocapitalization(.none)
                                .frame(height: 40)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.horizontal], 10)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                .padding([.horizontal], 10).background(Color("TextColour")).border(Color("TextColour"))
                        }.padding([.vertical],5)
                        
                        
                        
                        
                        
                        Button(action: {
                            // Action to perform when the button is tapped
                            loginVM.registerUser(){
                                
                                result in
                                
                                switch result {
                                case .success(_):
                                    
                                    coordinator.path.append(.login)
                                case .failure(let error):
                                    loginVM.errorMessage = error.errorMessage
                                }
                                
                            }
                            
                        }) {
                            Text("Sign Up")
                                .font(.headline)
                                .padding()
                                .background(Color.orange) // Set the button's background color
                                .foregroundColor(.white) // Set the text color
                                .cornerRadius(10) // Round the button's corners
                        }
                        
                        if let errorMessage = loginVM.errorMessage{
                            Text(errorMessage)
                        }
                        
                    }.padding()
                    
                                        VStack{
                                            HStack{
                    
                                                Text("You have an account ?")
                    
                                                NavigationLink(destination: LoginView()) {
                                                    Text("Sign In")
                                                        .foregroundColor(.blue)
                                                }
                    
                                            }
                    
                                        }
                    
                    
                    Spacer()
                }.padding(.top,75)
                
                
                
            }.background(Color("bgcolour"))
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignupView()
}
