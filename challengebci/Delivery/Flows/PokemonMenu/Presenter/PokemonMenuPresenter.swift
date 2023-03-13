//
//  PokemonMenuPresenter.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 13/3/23.
//  
//

import Foundation
import Combine

protocol PokemonMenuPresenterProtocol {
    var results: [PokemonMenuDetailsResult] { get set }
}

final class PokemonMenuPresenter: PokemonMenuPresenterProtocol, ObservableObject {
    
    var results: [PokemonMenuDetailsResult] = []
    var url: String
    var category: String
    private let interactor: PokemonMenuInteractorProtocol
    
    init(url: String,
         category: String,
         interactor: PokemonMenuInteractorProtocol) {
        self.url = url
        self.category = category
        self.interactor = interactor
    }
    
    func pokemonDetails(completion: @escaping (Bool) -> Void) {
        interactor.pokemonMenu(url: url, query: []) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let element):
                self.results = element.results
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }
}
