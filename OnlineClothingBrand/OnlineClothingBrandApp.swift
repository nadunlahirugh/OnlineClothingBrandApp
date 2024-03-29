//
//  OnlineClothingBrandApp.swift
//  OnlineClothingBrand
//
//  Created by Akvasoft Pvt Ltd on 2024-03-25.
//

import SwiftUI
import Firebase

//enum Route : Hashable {
//    case login
//}
//
//
//class Coordinator : ObservableObject{
//    @Published var path = [Route]()
//}

enum Route: Hashable {
    case login
    // Add more cases for other destinations in your app
}

class Coordinator: ObservableObject {
    @Published var path = [Route]()
    
    // Function to navigate to a specific route
    func navigate(to route: Route) {
        path.append(route)
    }
    
    // Function to navigate back
    func navigateBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
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
