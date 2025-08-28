//
//  StoreInfo.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import Foundation

struct StoreInfo {
    var name: String
    var address: String
    var isOpen: Bool
    var openUntil: String
    var rating: Double
    var ratingCount: Int
    var saleNote: String
    var deliveryNote: String
}


/**
 struct StoreInfo: Codable {
     var address: String
     var isOpen: Bool
     var openUntil: String
     var rating: Double
     var ratingCount: Int
     var saleNote: String
     var deliveryNote: String
     
     let name: LocalizedName
     
     
     struct LocalizedName: Codable {
         let en: String?
         let ar: String?
     }
 }

 */
