//
//  HomeViewModel.swift
//  HaatDelivery
//
//  Created by Ruchit on 28/08/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var moodOptions: [Category] = []
    @Published var categories: [Category] = []
    @Published var marketCards: [MarketCard] = []

    init() {
        loadMockData()
    }

    func loadMockData() {
        moodOptions = [
            .init(title: "BREAKFAST", imageName: "88x88px"),
            .init(title: "LUNCH", imageName: "88x88px"),
            .init(title: "DINNER", imageName: "88x88px"),
            .init(title: "DESSERT", imageName: "88x88px"),
            .init(title: "SNACKS", imageName: "88x88px")
        ]
        
        categories = [
            .init(title: "Category 1", imageName: "85x85px"),
            .init(title: "Category 2", imageName: "85x85px"),
            .init(title: "Category 3", imageName: "85x85px")
        ]
        
        marketCards = [
            .init(title: "Business in horizontal category", imageName: "85x85px", badge: "UP TO 10%", subBadge: nil, isFree: false, openUntil: "11:00", subtitle: "Umm Al Fahem, Ain al-N..."),
            .init(title: "Discount Store", imageName: "85x85px", badge: "DISCOUNT", subBadge: "UP TO 10%", isFree: false, openUntil: "11:00", subtitle: "Umm Al Fahem, Ain al-N..."),
            .init(title: "Freebie Mart", imageName: "85x85px", badge: "UP TO 15%", subBadge: nil, isFree: true, openUntil: "11:00", subtitle: "Umm Al Fahem, Ain al-N...")
        ]
    }
}
