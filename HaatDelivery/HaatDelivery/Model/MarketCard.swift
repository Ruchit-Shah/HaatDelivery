//
//  MarketCard.swift
//  HaatDelivery
//
//  Created by Ruchit on 28/08/25.
//


import Foundation

struct MarketCard: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let badge: String
    let subBadge: String?
    let isFree: Bool
    let openUntil: String
}
