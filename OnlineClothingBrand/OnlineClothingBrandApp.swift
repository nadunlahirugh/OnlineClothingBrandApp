//
//  OnlineClothingBrandApp.swift
//  OnlineClothingBrand
//
//  Created by Akvasoft Pvt Ltd on 2024-03-25.
//

import SwiftUI
import Firebase

enum Route : Hashable {
    case login
}


class Coordinator : ObservableObject{
    @Published var path = [Route]()
}

@main
struct OnlineClothingBrandApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Configured Firebase")

    return true
  }
}
