//
//  PokemonListPresenter.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import Foundation
import Combine

protocol PokemonListPresenterProtocol {
    var result: [String] { get set }
}

final class PokemonListPresenter: PokemonListPresenterProtocol, ObservableObject {
    var result: [String] = []
    
    private let interactor: PokemonListInteractorProtocol
    
    init(interactor: PokemonListInteractorProtocol) {
        self.interactor = interactor
    }
}
