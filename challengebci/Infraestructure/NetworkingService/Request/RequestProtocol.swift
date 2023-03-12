//
//  RequestProtocol.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation
import Combine
import SwiftyJSON

protocol RequestProtocol {
    var session: URLSession { get }
    var error : ResponseHandlingError { get }
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue,
                    retries: Int) -> AnyPublisher<T, Error> where T: Decodable
}

extension RequestProtocol {
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue = .main,
                    retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {
        
        return session.dataTaskPublisher(for: request)
            .tryMap { (output) in
                guard  output.response is HTTPURLResponse else {
                    throw error.handlingGenericError()
                }
                print("REQUEST: \(request)")
                print("RESPONSE SUCCESS: \(JSON(output.data)) \n")
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ errorCapture in
                print("RESPONSE ERROR: \(errorCapture)")
                return error.handlingError(statusCode: errorCapture.errorCode ?? 404)
            })
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
}
