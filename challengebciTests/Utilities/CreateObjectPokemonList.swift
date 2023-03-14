//
//  CreateObjectPokemonList.swift
//  challengebciTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation
import challengebci

class CreateObjectPokemonList {
    static var elements: PokemonListModelMock {
        let data = String.json(fromFile: "pokemon", bundle: BundleTest.bundleTest)
        let decoder = JSONDecoder()
        let decodable  = try! decoder.decode(PokemonListModelMock.self, from: data)
        return decodable
    }
}

extension String {
    static func json(fromFile: String, bundle: Bundle) -> Data {
        let data = Data(jsonFileName: fromFile, bundle: bundle)
        return data
    }
}

extension Data {
    init(jsonFileName: String, bundle: Bundle = Bundle.main) {
        do {
            if let file = bundle.url(forResource: jsonFileName, withExtension: "json") {
                try self.init(contentsOf: file)
                return
            }
        } catch {
            print(error.localizedDescription)
        }
        self.init()
    }
}
