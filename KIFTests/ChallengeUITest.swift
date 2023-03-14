//
//  ChallengeUITest.swift
//  KIFTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import XCTest
import KIF
@testable import challengebci

class ChallengeUITest: BaseUITest {
    
    func testShowDetails() {
        _ = PokemonListPage(test: self)
            .waitElementVisible()
            .swipeCollectionView()
            .showDetails()
            .waitElementVisible()
            .back()
    }
    
    func testShowMenu() {
        _ = PokemonListPage(test: self)
            .waitElementVisible()
            .tapMenu()
            .showAbility()
            .waitElementVisible()
            .back()
    }
    
    func testSearchPokem() {
        _ = PokemonListPage(test: self)
            .waitElementVisible()
            .tapSearch()
            .enterText()
            .showDetails()
            .waitElementVisible()
            .back()
            
    }
    
}
