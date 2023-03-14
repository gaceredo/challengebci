//
//  InteractorTestCase.swift
//  challengebciTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import XCTest

final class InteractorTestCase: XCTestCase {

    var interactor: PokemonListInteractorMock!
    var invokedExecute = false
    var invokedExecuteCount = 0
    var isSuccess: Bool = true
    
    override func setUpWithError() throws {
        self.interactor = PokemonListInteractorMock(dependencies: PokemonListInteractorDependenciesMock())
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testPokemonListFail() {
        let testExpectation = expectation(description: "lalala")
        interactor.pokemonListFail(query: []) { result in
            switch result {
            case .failure:
                XCTAssertEqual(self.interactor.invokedExecute, false)
                XCTAssertEqual(self.interactor.invokedExecuteCount, 0)
                testExpectation.fulfill()
            case .success:
                XCTFail()
            }
        }
        wait(for: [testExpectation], timeout: 0.10)
    }
    
    func testPokemonListSuccess() {
        let testExpectation = expectation(description: "lalala")
        interactor.pokemonListSuccess(query: []) { result in
            switch result {
            case .failure:
                XCTFail()
            case .success:
                XCTAssertEqual(self.interactor.isSuccess, true)
                XCTAssertEqual(self.interactor.invokedExecuteCount, 1)
                testExpectation.fulfill()
            }
        }
        wait(for: [testExpectation], timeout: 0.10)
    }
    
    
    override func tearDownWithError() throws {
        self.interactor = nil
    }//


}
