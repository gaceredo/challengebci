//
//  PokemonListInteractor.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import Foundation

protocol PokemonListInteractorProtocol {
    
}

final class PokemonListInteractor: PokemonListInteractorProtocol {
    private let dependencies: PokemonListInteractorDependenciesProtocol
    
    init(dependencies: PokemonListInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
