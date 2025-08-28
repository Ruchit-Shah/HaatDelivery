//
//  HomeViewModel.swift
//  HaatDelivery
//
//  Created by Ruchit on 28/08/25.
//


//import Foundation
//
//@MainActor
//class HomeViewModel: ObservableObject {
//    @Published var venueName: String = ""
//    
//    func loadVenueInfo() async {
//        let endpoint = Endpoint(
//            path: "api/venue/4012/info",
//            queryItems: [
//                URLQueryItem(name: "userLatitude", value: "0.0"),
//                URLQueryItem(name: "userLongitude", value: "0.0"),
//                URLQueryItem(name: "isByLocation", value: "false")
//            ],
//            method: "GET"
//        )
//
//        do {
//            let response = try await APIClient.shared.request(endpoint, responseType: StoreInfo.self)
//            venueName = response.name.en ?? "Unknown"
//        } catch {
//            print("Error loading venue:", error)
//        }
//    }
//}
