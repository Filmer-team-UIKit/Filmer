//
//  User.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import Foundation

public struct User {
    public let email: String
    public let password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
