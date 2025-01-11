//
//  Service.swift
//  NewsPostsReader
//
//  Created by Andrew Vale on 10/01/25.
//
import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
    case PATCH = "PATCH"
}

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError
}

class Service {
    private let baseURL = URL(string: "http://127.0.0.1:8080/")
    func makeRequest<T: Decodable>(endpoint: String,
                                   method: HTTPMethod,
                                   body: Data? = nil,
                                   headers: [String: String] = [:],
                                   responseType: T.Type) async throws -> T {
        guard let url = URL(string: endpoint, relativeTo: baseURL) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        headers.forEach{ key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw APIError.decodingError
            }
        } catch {
            throw APIError.networkError(error)
        }
    }
}
