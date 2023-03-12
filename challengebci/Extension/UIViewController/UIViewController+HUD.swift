//
//  UIViewController+HUD.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    func showHud() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }

    func hideHud() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
