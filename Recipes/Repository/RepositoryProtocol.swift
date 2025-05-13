//
//  RepositoryProtocol.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import Foundation

protocol RepositoryProtocol {
    var url: URL { get }
}

extension RepositoryProtocol {
    func getJSON<T>() throws -> T where T: Decodable {
        let fileURL = url
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
