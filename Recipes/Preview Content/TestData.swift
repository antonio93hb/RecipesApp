//
//  TestData.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import Foundation

struct RepositoryTest: RepositoryProtocol {
    var url: URL {
        Bundle.main.url(forResource: "recipes_datatest", withExtension: "json")!
    }
    var urlDoc: URL {
        .documentsDirectory.appending(path: "recipes_datatest.json")
    }
}
