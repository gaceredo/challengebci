//
//  Page.swift
//  KIFTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation

protocol Page {
    var test: BaseUITest! {get set}
    var pageIdentifier: String {get}
    
    init()
    init(test: BaseUITest)
}
