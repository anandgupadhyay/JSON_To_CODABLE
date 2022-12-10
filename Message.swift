//
//  Message.swift
//  SwiftConcurrencyByExample
//
//  Created by Anand Upadhyay on 10/12/22.
//

import Foundation
struct Message: Codable {
    let id: Int
    let user: String
    let text: String
}
