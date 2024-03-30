//
//  ProductModel.swift
//  OnlineClothingBrand
//
//  Created by Akvasoft Pvt Ltd on 2024-03-29.
//

import Foundation

import Foundation
import SwiftUI

struct ProductModel: Identifiable {
    
    let id = UUID().uuidString
    let name : String
//    let image : [String]
    let image : String
    let description : String
    let sizes : [String];
    let priceWithDolar : String;
    let price : NSNumber;
    let color_variations : [String];
    let rating : NSNumber;
}
