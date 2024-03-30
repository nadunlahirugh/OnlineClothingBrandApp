//
//  ProductListView.swift
//  OnlineClothingBrand
//
//  Created by Akvasoft Pvt Ltd on 2024-03-26.
//

import SwiftUI

struct ProductListView: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 0
    @ObservedObject var productsViewModel = ProductsViewModel();
    
    
    
    //    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    
    
    init(){
        productsViewModel.selectProductCheck = false;
        productsViewModel.getCategoryData();
        productsViewModel.getAllProductItemList();
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        
                        //                        ScrollView (.horizontal, showsIndicators: false) {
                        //                            HStack {
                        //                                ForEach(0 ..< productsViewModel.categories.count) { i in
                        //                                    Button(action: {selectedIndex = i}) {
                        //                                        CategoryView(isActive: selectedIndex == i, text: productsViewModel.categories[i] as! String)
                        //                                    }
                        //                                }
                        //                            }
                        //                            .padding()
                        //                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(productsViewModel.categories.indices, id: \.self) { i in
                                    Button(action: {
                                        
                                        selectedIndex = i
                                        
                                        productsViewModel.categorieName = productsViewModel.categories[i] as! String
                                        
                                        productsViewModel.getProductItemWithCategory()
                                        
                                        print("index")
                                        print(i)
                                        
                                        
                                    }) {
                                        CategoryView(isActive: selectedIndex == i, text : productsViewModel.categories[i] as! String)
                                        
                                        
                                    }
                                    
                                }
                            }
                            .padding()
                        }
                        
                        //                        Text("Popular")
                        //                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                        //                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 1) { i in
                                    NavigationLink(destination: ProductDetailView(), label: {
                                        //                                        ForEach(productsViewModel.products) { product in
                                        //
                                        //                                            ProductCardView(product: product, size: 210)
                                        //                                        }
                                        
                                        ForEach(productsViewModel.products.indices, id: \.self) { index in
//                                            Button(action: {
//                                                // Handle click event here, you can use 'index' to get the selected index
//                                                print("Selected product index: \(index)")
//                                                
//                                                productsViewModel.selectProduct = productsViewModel.products[index]
//                                                
//                                                return;
//                                            }) {
//                                                ProductCardView(product: productsViewModel.products[index], size: 210)
//                                            }
                                            
                                            NavigationLink(destination: ProductDetailView()) {
                                                   Button(action: {
                                                       // Handle click event here, you can use 'index' to get the selected index
                                                       print("Selected product index: \(index)")
                                                       
                                                       productsViewModel.selectProduct = productsViewModel.products[index]
                                                       
                                                       return;
                                                   }) {
                                                       ProductCardView(product: productsViewModel.products[index], size: 210)
                                                   }
                                               }
                                        }
                                        
                                    })
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                            //
                            ////                            NavigationLink(destination: ProductDetailView(), isActive: $productsViewModel.selectProductCheck) {
                            ////                                EmptyView()
                            ////                            }
                            //                        }
                            //                        .padding(.bottom)
                            
                            
                            //                        NavigationView {
                            //                            ScrollView(.horizontal, showsIndicators: false) {
                            //                                HStack(spacing: 0) {
                            //                                    ForEach(productsViewModel.products) { product in
                            //                                        NavigationLink(destination: ProductDetailView(product: product)) {
                            //                                            ProductCardView(product: product, size: 210)
                            //                                        }
                            //                                        .foregroundColor(.black)
                            //                                    }
                            //                                    .padding(.leading)
                            //                                }
                            //                            }
                            //                            .padding(.bottom)
                            //                        }
                            
                            
                            
                            
                            
                            
                            
                            //                        Text("Best")
                            //                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            //                            .padding(.horizontal)
                            //
                            //                        ScrollView (.horizontal, showsIndicators: false) {
                            //                            HStack (spacing: 0) {
                            //                                ForEach(0 ..< 4) { i in
                            //                                    ProductCardView(image: Image("chair_\(4-i)"), size: 180)
                            //                                }
                            //                                .padding(.leading)
                            //                            }
                            //                        }
                            
                        }
                    }
                    
                    VStack {
                        Spacer()
                        BottomNavBarView()
                    }
                }
            }
        }
    }
}
    
    #Preview {
        ProductListView()
    }
    
    struct AppBarView: View {
        var body: some View {
            HStack {
                Button(action: {}) {
                    Image("menu")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10.0)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(uiImage: #imageLiteral(resourceName: "Profile"))
                        .resizable()
                        .frame(width: 42, height: 42)
                        .cornerRadius(10.0)
                }
            }
            .padding(.horizontal)
        }
    }
    
    struct TagLineView: View {
        var body: some View {
            Text("Find the \nBest ")
                .font(.custom("PlayfairDisplay-Regular", size: 28))
                .foregroundColor(Color("Primary"))
            + Text("Furniture!")
                .font(.custom("PlayfairDisplay-Bold", size: 28))
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
        }
    }
    
    struct SearchAndScanView: View {
        @Binding var search: String
        var body: some View {
            HStack {
                HStack {
                    Image("Search")
                        .padding(.trailing, 8)
                    TextField("Search Furniture", text: $search)
                }
                .padding(.all, 20)
                .background(Color.white)
                .cornerRadius(10.0)
                .padding(.trailing, 8)
                
                Button(action: {}) {
                    Image("Scan")
                        .padding()
                        .background(Color("Primary"))
                        .cornerRadius(10.0)
                }
            }
            .padding(.horizontal)
        }
    }
    
    struct CategoryView: View {
        
        let isActive: Bool
        let text: String
        
        
        var body: some View {
            VStack (alignment: .leading, spacing: 0) {
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
                if (isActive) { Color("Primary")
                        .frame(width: 15, height: 2)
                        .clipShape(Capsule())
                    
                    
                    
                }
                
                
            }
            .padding(.trailing)
            
            
            
        }
        
        
    }
    
    struct ProductCardView: View {
        //    let image: Image
        let product: ProductModel
        let size: CGFloat
        @ObservedObject var productsViewModel = ProductsViewModel();
        
        
        var body: some View {
            VStack {
                //            product.images[0]
                //                .resizable()
                //                .frame(width: size, height: 200 * (size/210))
                //                .cornerRadius(20.0)
                
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size, height: 200 * (size/210))
                            .cornerRadius(20.0)
                    default:
                        // Placeholder or loading view
                        ProgressView()
                            .frame(width: size, height: 200 * (size/210))
                            .cornerRadius(20.0)
                    }
                }
                
                
                Text(product.name).font(.title3).fontWeight(.bold)
                
                HStack (spacing: 2) {
                    ForEach(0 ..< Int(product.rating)) { item in
                        Image("star")
                    }
                    Spacer()
                    
                    
                    Text(product.priceWithDolar)
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            .frame(width: size)
            .padding()
            .background(Color.white)
            .cornerRadius(20.0)
            
       
        }
        
        //    func extractImageURL(from googleURL: String) -> URL? {
        //            guard let urlComponents = URLComponents(string: googleURL),
        //                  let queryItems = urlComponents.queryItems else {
        //                return nil
        //            }
        //
        //            for queryItem in queryItems {
        //                if queryItem.name == "url", let imageURLString = queryItem.value {
        //                    return URL(string: imageURLString)
        //                }
        //            }
        //
        //            return nil
        //        }
    }
    
    
    struct BottomNavBarView: View {
        var body: some View {
            HStack {
                BottomNavBarItem(image: Image("Home"), action: {})
                BottomNavBarItem(image: Image("fav"), action: {})
                BottomNavBarItem(image: Image("shop"), action: {})
                BottomNavBarItem(image: Image("User"), action: {})
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
        }
    }
    
    struct BottomNavBarItem: View {
        let image: Image
        let action: () -> Void
        var body: some View {
            Button(action: action) {
                image
                    .frame(maxWidth: .infinity)
            }
        }
    }

