//
//  UIViewController+Extension.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import UIKit

extension UIViewController {
    func resetNextControllerBackButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: " ",
            style: .plain,
            target: nil,
            action: nil
        )
    }
}
