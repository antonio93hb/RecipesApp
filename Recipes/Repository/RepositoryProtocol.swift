//
//  RepositoryProtocol.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import Foundation

protocol RepositoryProtocol {
    var url: URL { get }
    var urlDoc: URL { get }
}

extension RepositoryProtocol {
    func getJSON<T>() throws -> T where T: Decodable {
        let fileURL = if FileManager.default.fileExists(atPath: urlDoc.path()) { urlDoc } else { url }
        
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
