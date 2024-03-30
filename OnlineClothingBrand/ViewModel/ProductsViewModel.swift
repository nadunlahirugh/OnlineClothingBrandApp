//
//  ProductsViewModel.swift
//  OnlineClothingBrand
//
//  Created by Akvasoft Pvt Ltd on 2024-03-29.
//

import Foundation

import SwiftUI

import Firebase

import FirebaseAuth
import FirebaseFirestore


class ProductsViewModel : ObservableObject {
    
    @Published var products: [ProductModel] = []
    
    @Published var selectProduct: ProductModel?
    @Published var categories = [];
    
    @Published var productsList = [];
    
//    @Published var productDetail: ProductModel = []
    
    @Published var categorieName : String = "";
    
    @Published var selectProductCheck: Bool = false
    
   
    func getCategoryData() {

  
        let db = Firestore.firestore()
        
      
        
      db.collection("products").getDocuments{snapshot,error in
            if error ==  nil {
                
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        
//                        self.categoriesWithModel = snapshot.documents.map { data in
//                            
//                         
//                            let categorie = data["category_name"] as? String ?? ""
//                            
//                           
//                              return CategoryModel(category: categorie)
//                           
//                            
//                        }
//                        
                        
                        self.categories.removeAll()
                        self.categories.append("All")
                                  
                                  // Iterate over documents and extract category names
                                  for document in snapshot.documents {
                                      if let categoryName = document["category_name"] as? String {
                                          self.categories.append(categoryName)
                                      }
                                  }
                        
                        
                                  
                                  // Print categories array
                                  print("Categories: \(self.categories)")
                        
                        
                        }
                }
            } else{
                
            }
            
        }
        
        print("CATEGORYYYYYYYYYYYYYYYY_--------")
    print(self.categories)
        }
   
    
    
    func getAllProductItemList() {
        
        
        print("get list")
        print(self.categorieName)

  
        let db = Firestore.firestore()
        
        db.collection("products").getDocuments{snapshot,error in
            if error ==  nil {
                
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.products = snapshot.documents.compactMap { document in
                                              let data = document.data()
                                              print("db get data")
                            
                            if let items = data["items"] as? [[String: Any]] {
                                
                                print("items")
                                print(items)
                                
                                for item in items {
                                    
                                         let name = item["name"] as? String ?? ""
                                         let image = item["image"] as? String ?? ""
                                         let description = item["description"] as? String ?? ""
                                         let sizes = item["sizes"] as? [String] ?? []
                                         let price = item["price"] as? NSNumber ?? 0
                                    
                                          let priceWithDolar = "\(price)$"
                                    
                                         
                                         let colorVariations = item["color_variations"] as? [String] ?? []
                                         let rating = item["rating"] as? NSNumber ?? 0
                                    
                                    print("rating")
                                    print(rating)
                                         
                                    let product = ProductModel(name: name, image: image, description: description, sizes: sizes, priceWithDolar:priceWithDolar, price:price, color_variations: colorVariations, rating: rating)
                                         
                                         return product
                                     }
                                
                                
                                
                            }

                            
                            return nil
                                          }
                        
                        
                      

                                  print("ProductsList: \(self.products)")
                        
                        
                        }
                }
            } else{
                
            }
        
      }
        
     
        }
    
    
    
    
    func getProductItemWithCategory() {
        
        
        print("get list")
        print(self.categorieName)

  
        let db = Firestore.firestore()
        
     
        db.collection("products").whereField("category_name", isEqualTo: self.categorieName) .getDocuments{snapshot,error in
            if error ==  nil {

                if let snapshot = snapshot {
                    DispatchQueue.main.async {

                        self.products = snapshot.documents.compactMap { document in
                                              let data = document.data()
                                              print("db get data")
                            
                            if let items = data["items"] as? [[String: Any]] {
                                
                                print("items")
                                print(items)
                                
                                for item in items {
                                    
                                         let name = item["name"] as? String ?? ""
                                         let image = item["image"] as? String ?? ""
                                         let description = item["description"] as? String ?? ""
                                         let sizes = item["sizes"] as? [String] ?? []
                                         let price = item["price"] as? NSNumber ?? 0
                                    
                                          let priceWithDolar = "\(price)$"
                                    
                                         
                                         let colorVariations = item["color_variations"] as? [String] ?? []
                                         let rating = item["rating"] as? NSNumber ?? 0
                                    
                                    print("rating")
                                    print(rating)
                                         
                                    let product = ProductModel(name: name, image: image, description: description, sizes: sizes, priceWithDolar:priceWithDolar, price:price, color_variations: colorVariations, rating: rating)
                                         
                                         return product
                                     }
                                
                                
                                
                            }

                            
                            return nil
                                          }






                                  // Print categories array
                                  print("Products: \(self.products)")


                        }
                }
            } else{

            }
            
        }
        
     
        }
    
    func selectProduct(index : Int) {
        
        self.selectProduct = self.products[index]
        
        
     }
    
    
    
}












