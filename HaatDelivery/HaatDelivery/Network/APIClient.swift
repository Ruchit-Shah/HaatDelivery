//
//  APIClient.swift
//  HaatDelivery
//
//  Created by Ruchit on 28/08/25.
//


import Foundation

final class APIClient {
    static let shared = APIClient()
    
    private let baseURL = URL(string: "https://user-new-app-staging.internal.haat.delivery")!

    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T {
        let request = endpoint.asURLRequest(baseURL: baseURL)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResp = response as? HTTPURLResponse, httpResp.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
