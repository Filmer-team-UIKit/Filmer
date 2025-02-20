//
//  MockServ.swift
//  Platform
//
//  Created by Иван Карплюк on 20.02.2025.
//

import Foundation


public class MockRegistrationService: RegistrationServiceProtocol {
    public init() { }
    
    public func register(user: User, completion: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(.success(()))
        }
    }
}
