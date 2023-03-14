//
//  PokemonListPage.swift
//  KIFTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation

enum PokemonListElement: String {
    case collectionView = "collectionView"
    case searchButton = "search"
    case menu = "menu"
    case berry = "berry"
    case text = "pika"
}

struct PokemonListPage {
    let test: BaseUITest
       
    init(test: BaseUITest) {
         self.test = test
    }
    func waitElementVisible() -> PokemonListPage {
        test.waitforTimeInterval()
        return PokemonListPage(test: test)
    }
    
    func swipeCollectionView() -> PokemonListPage {
        test.swipeTableView(identifier: PokemonListElement.collectionView.rawValue)
        return PokemonListPage(test: test)
    }
    
    func tapSearch() -> PokemonListPage {
        test.tapButton(buttonName: PokemonListElement.searchButton.rawValue)
        return PokemonListPage(test: test)
    }
    func tapMenu() -> PokemonListPage {
        test.tapButton(buttonName: PokemonListElement.menu.rawValue)
        return PokemonListPage(test: test)
    }
    
    func showDetails() -> PokemonListDetailsPage {
        test.tapRow(identifier: PokemonListElement.collectionView.rawValue)
        return PokemonListDetailsPage(test: test)
    }
    
    func showAbility() -> PokemonListDetailsPage {
        test.tapButton(buttonName: PokemonListElement.berry.rawValue)
        return PokemonListDetailsPage(test: test)
    }
    
    func enterText() -> PokemonListPage {
        test.enterText(text: PokemonListElement.text.rawValue)
        return PokemonListPage(test: test)
    }
}
