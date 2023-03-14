//
//  PokemonListPresenterProtocol.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import UIKit

protocol PokemonListPresenterProtocol {
    var pokemonList: [PokemonListModelResult] { get set }
    var menuItems: PokemonMenuModel? {get set}
    var localizedDescription: String { get set }
    func pokemonList(completion: @escaping (Bool) -> Void)
}
