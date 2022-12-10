//
//  Usage.swift
//  SwiftConcurrencyByExample
//
//  Created by Anand Upadhyay on 10/12/22.
//

import Foundation
struct Usage {
    static func callApi() async {
        do {
            // Fetch and decode a specific type
            let url1 = URL(string: "https://hws.dev/user-24601.json")!
            let user = try await URLSession.shared.decode(User.self, from: url1)
            print("Downloaded \(user.name)")
    
            // Infer the type because Swift has a type annotation
            let url2 = URL(string: "https://hws.dev/inbox.json")!
            let messages: [Message] = try await URLSession.shared.decode(from: url2)
            print("Downloaded \(messages.count) messages")
    
            // Create a custom URLSession and decode a Double array from that
            let config = URLSessionConfiguration.default
            config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            let session = URLSession(configuration: config)
    
            let url3 = URL(string: "https://hws.dev/readings.json")!
            let readings = try await session.decode([Double].self, from: url3)
            print("Downloaded \(readings.count) readings")
        } catch {
            print("Download error: \(error.localizedDescription)")
        }
    }
}
