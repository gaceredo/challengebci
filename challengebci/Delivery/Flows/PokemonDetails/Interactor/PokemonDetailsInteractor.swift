//
//  PokemonDetailsInteractor.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import Foundation

protocol PokemonDetailsInteractorProtocol {
    
}

final class PokemonDetailsInteractor: PokemonDetailsInteractorProtocol {
    private let dependencies: PokemonDetailsInteractorDependenciesProtocol
    
    init(dependencies: PokemonDetailsInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
