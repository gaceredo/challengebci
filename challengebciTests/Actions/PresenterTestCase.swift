//
//  PresenterTestCase.swift
//  challengebciTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import XCTest

final class PresenterTestCase: XCTestCase {

    var presenter: PokemonListPresenterMock!
    
    override func setUpWithError() throws {
        let dependencies = PokemonListInteractorDependenciesMock()
        let interactor = PokemonListInteractorMock(dependencies: dependencies)
        presenter = PokemonListPresenterMock(interactor: interactor)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        presenter = nil
        
    }

    func testPokemonListResultSuccess() {
        let testExpectation = expectation(description: "lalala")
        XCTAssertEqual(self.presenter.pokemonList.count, 0)
        XCTAssertEqual(self.presenter.invokedExecuteCount, 0)
        
        presenter.pokemonListSuccess {[weak self] isSuccess in
            guard let self = self else {
                XCTFail()
                return
            }
            if isSuccess {
                XCTAssertEqual(self.presenter.pokemonList.count, 150)
                XCTAssertEqual(self.presenter.invokedExecuteCount, 1)
                testExpectation.fulfill()
            } else {
                XCTFail()
            }
        }
        wait(for: [testExpectation], timeout: 0.10)
    }
    
    func testPokemonListResultFail() {
        let testExpectation = expectation(description: "lalala")
        XCTAssertEqual(self.presenter.pokemonList.count, 0)
        XCTAssertEqual(self.presenter.invokedExecuteCount, 0)
        
        presenter.pokemonListFail { [weak self] isSuccess in
            guard let self = self else {
                XCTFail()
                return
            }
            if isSuccess {
                XCTFail()
            } else {
                XCTAssertEqual(self.presenter.pokemonList.count, 0)
                XCTAssertEqual(self.presenter.invokedExecuteCount, 0)
                testExpectation.fulfill()
            }
        }
        wait(for: [testExpectation], timeout: 0.10)
    }
}
