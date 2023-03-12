//
//  Error+extension.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import UIKit

extension Error {
    var errorCode:Int? {
        return (self as NSError).code
    }
}

