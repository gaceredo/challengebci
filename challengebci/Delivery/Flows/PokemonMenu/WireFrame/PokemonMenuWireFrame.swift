//
//  PokemonMenuWireFrame.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 13/3/23.
//  
//

import UIKit

protocol PokemonMenuWireFrameProtocol {
    static func makePokemonMenuView(url: String, category: String) -> UIViewController
}

struct PokemonMenuWireFrame: PokemonMenuWireFrameProtocol {
    static func makePokemonMenuView(url: String, category: String) -> UIViewController {
        let refactorUrl = url.replacingOccurrences(of: AppEnvironment.baseURL, with: "")
        let interactorDependencies = PokemonMenuInteractorDependencies()
        let interactor = PokemonMenuInteractor(dependencies: interactorDependencies)
        let presenter = PokemonMenuPresenter(url: refactorUrl,
                                             category: category,
                                             interactor: interactor)
        let view = PokemonMenuViewController(presenter: presenter)
        return view
    }
}
