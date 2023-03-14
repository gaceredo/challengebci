//
//  PopularListDetailsPage.swift
//  KIFTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation

enum PokemonListDetailsElement: String {
    case back = " "
    case viewDetails = "populate_details"
    case collectionView = "similar_collection"
}

struct PokemonListDetailsPage {

    let test: BaseUITest

    init(test: BaseUITest) {
        self.test = test
    }
    func waitElementVisible() -> PokemonListDetailsPage {
        test.waitforTimeInterval()
        return PokemonListDetailsPage(test: test)
    }
    
    func back() -> PokemonListDetailsPage {
        test.tapButton(buttonName: PokemonListDetailsElement.back.rawValue)
        return PokemonListDetailsPage(test: test)
    }
    func swipeDetails() -> PokemonListDetailsPage {
        test.swipeTableView(identifier: PokemonListDetailsElement.viewDetails.rawValue,
                            size: 50)
       return PokemonListDetailsPage(test: test)
    }
    
    func swipeCollectionView() -> PokemonListDetailsPage {
        test.swipeCollectionView(identifier: PokemonListDetailsElement.collectionView.rawValue)
        return PokemonListDetailsPage(test: test)
    }
   
}

