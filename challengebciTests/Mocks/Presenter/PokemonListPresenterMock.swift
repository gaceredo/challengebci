//
//  PokemonListPresenterMock.swift
//  challengebciTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation
import challengebci

protocol PokemonListPresenterProtocolMock {
    var pokemonList: [PokemonListModelResultMock] { get set }
    func pokemonListSuccess(completion: @escaping (Bool) -> Void)
    func pokemonListFail(completion: @escaping (Bool) -> Void)
}

class PokemonListPresenterMock: PokemonListPresenterProtocolMock {
    
    var pokemonList: [PokemonListModelResultMock] = []
    var invokedExecuteCount = 0
    var isSuccess: Bool = true
    
    
    private let interactor: PokemonListInteractorMock
    
    init(interactor: PokemonListInteractorMock) {
        self.interactor = interactor
    }
    
    
    func pokemonListSuccess(completion: @escaping (Bool) -> Void) {
        
        interactor.pokemonListSuccess(query: []) { result in
            switch result {
            case .failure:
                self.isSuccess = false
                completion(false)
            case .success(let data):
                self.pokemonList = data.results
                self.invokedExecuteCount += 1
                self.isSuccess = true
                completion(true)
            }
        }
    }
    
    func pokemonListFail(completion: @escaping (Bool) -> Void) {
        
        interactor.pokemonListFail(query: []) { result in
            switch result {
            case .failure:
                self.isSuccess = false
                completion(false)
            case .success(let data):
                self.pokemonList = data.results
                self.invokedExecuteCount += 1
                self.isSuccess = true
                completion(true)
            }
        }
        
    }
    
}
