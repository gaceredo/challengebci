//
//  MethodEndpointMock.swift
//  challengebciTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

enum FeedMock {
    case pokemonListSuccess
    case pokemonListFail
}

extension FeedMock: Endpoint {
    
    var httpMethod: RequestMethod {
        switch self {
        case .pokemonListSuccess, .pokemonListFail :
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .pokemonListFail:
            return "/api/v2/error?offset=0&limit=150"
        case .pokemonListSuccess:
            return "/api/v2/pokemon"
       
        }
    }
}


