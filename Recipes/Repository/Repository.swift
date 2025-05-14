//
//  Repository.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//
import Foundation

struct Repository: RepositoryProtocol {
    var url: URL {
        Bundle.main.url(forResource: "recipes_formatted", withExtension: "json")!
    }
    var urlDoc: URL {
        .documentsDirectory.appending(path: "recipes_formatted.json")
    }
}
