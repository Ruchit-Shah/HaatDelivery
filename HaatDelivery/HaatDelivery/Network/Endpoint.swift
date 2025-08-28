//
//  Endpoint.swift
//  HaatDelivery
//
//  Created by Ruchit on 28/08/25.
//


import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
    let method: String

    func asURLRequest(baseURL: URL) -> URLRequest {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
        components.queryItems = queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = method

        // Add default headers
        request.addValue("Bearer <token>", forHTTPHeaderField: "Authorization")
        request.addValue("iOS", forHTTPHeaderField: "Platform")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // ...add others as needed
        return request
    }
}
