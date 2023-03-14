//
//  RequestProtocolMock.swift
//  challengebciTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation
import Combine
import challengebci

protocol RequestProtocolMock {
    var session: URLSession { get }
    var error : ResponseHandlingError { get }
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue,
                    retries: Int) -> AnyPublisher<T, Error> where T: Decodable
}

extension RequestProtocolMock {
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue = .main,
                    retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {
        
        return session.dataTaskPublisher(for: request)
            .tryMap { (output) in
                guard let httpResponse = output.response as? HTTPURLResponse,
                         httpResponse.statusCode == 200 else
                       { throw URLError(.badServerResponse) }
                
                let data = String.json(fromFile: "pokemon", bundle: BundleTest.bundleTest)
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ errorCapture in
                return self.error.handlingError(statusCode: errorCapture.errorCode ?? 404)
            })
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
    
}
