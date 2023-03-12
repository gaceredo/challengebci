//
//  PokemonListWireFrame.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import UIKit

protocol PokemonListWireFrameProtocol {
   static func makePokemonListView() -> UIViewController
}

struct PokemonListWireFrame: PokemonListWireFrameProtocol {
    static func makePokemonListView() -> UIViewController {
        
        let interactorDependencies = PokemonListInteractorDependencies()
        let interactor = PokemonListInteractor(dependencies: interactorDependencies)
        let presenter = PokemonListPresenter(interactor: interactor)
        let view = PokemonListViewController(presenter: presenter)
        
        return view
    }
}
