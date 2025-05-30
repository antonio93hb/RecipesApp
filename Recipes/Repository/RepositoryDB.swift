//
//  RepositoryDB.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 21/5/25.
//

import Foundation
import SwiftData

final class ProductRepositoryDB {
    let reporitory: RepositoryProtocol
    
    init(reporitory: RepositoryProtocol = Repository()) {
        self.reporitory = reporitory
    }
}
