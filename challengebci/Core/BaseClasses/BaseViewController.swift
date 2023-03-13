//
//  BaseViewController.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import UIKit

/// Base view controller
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetNextControllerBackButtonTitle()
    }
    
    func showAlert(title: String,
                   message: String,
                   titleButtonSuccess: String,
                   titleButtonCancel: String,
                   handler: ((UIAlertAction) -> Void)? = nil) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: titleButtonSuccess, style: UIAlertAction.Style.default, handler: handler))
        alert.addAction(UIAlertAction(title: titleButtonCancel, style: UIAlertAction.Style.cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    func showError(handler: ((UIAlertAction) -> Void)? = nil) {
        self.showAlert(title: Localizable.PokemonListView.genericErrorTitle.localized,
                       message: Localizable.PokemonListView.genericErrorMessage.localized,
                       titleButtonSuccess: Localizable.PokemonListView.titleButtonSuccess.localized,
                       titleButtonCancel: Localizable.PokemonListView.titleButtonCancel.localized,
                       handler: handler)
    }
}
