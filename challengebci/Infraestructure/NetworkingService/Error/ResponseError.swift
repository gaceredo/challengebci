//
//  ResponseError.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation

public enum ResponseError: Error {
    case ok

    case badRequest
    case unauthorized
    case forbidden
    case notFound

    case internalServerError
    case notImplemented
    case badGateway
    case servicesUnavailable

    case genericError
    
}
