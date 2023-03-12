//
//  UITableView+Style.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import UIKit

public extension UITableView {
    func hideFooterView() {
        self.tableFooterView = UIView(frame: .zero)
    }
}
