//
//  LoginViewModel.swift
//  OnlineClothingBrand
//
//  Created by Akvasoft Pvt Ltd on 2024-03-26.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

enum FBError : Error,Identifiable{
    case error(String)
    var id:UUID{
        UUID()
    }
    
    var errorMessage:String{
        switch self {
        case .error(let message):
            return message
        }
    }
}

class LoginViewModel : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var confirmPassword : String = ""
    @Published var errorMessage: String?
    @Published var isNavigationActive : Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    @Published var showSignInView : Bool = false
    
    
    
    func registerUser(completion:@escaping(Result<Bool,FBError>) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error {
                DispatchQueue.main.async {
                    completion(.failure(.error(error.localizedDescription)))
                }
            } else {
                let userID = authResult?.user.uid ?? ""
                let userData = ["email": self.email,"password":self.password]
                
                // Add user data to Firestore
                let db = Firestore.firestore()
                db.collection("users").document(userID).setData(userData) { error in
                    if let error {
                        DispatchQueue.main.async {
                            completion(.failure(.error(error.localizedDescription)))
                        }
                    } else {
                        DispatchQueue.main.async {
                            completion(.success(true))
                        }
                    }
                }
            }
        }
    }
    
    
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else {return}
            
            if let error = error {
                self.alertMessage = "Login failed: \(error.localizedDescription)"
                self.showAlert = true
            }
            else {
                // Authentication success, navigate to DashboardView
                self.navigateToDashboard()
            }
        }
    }
    
    func navigateToDashboard() {
        
        isNavigationActive = true
        
        
    }
}
    


