//
//  ConfigurableCell.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation

public protocol ConfigurableCell: ReusableCell {
    associatedtype DataType
    func configure(data: DataType)
}
