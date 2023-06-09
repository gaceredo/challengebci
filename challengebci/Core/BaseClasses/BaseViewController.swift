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
    
    func setMoreButton(data: Dictionary<String, String>,
                       completion: @escaping (UIAction) -> Void) {
        var actions: [UIAction] = []
        
        data.forEach {
            let action = UIAction(title: $0.key, identifier: .init($0.value), handler: { action in
                completion(action)
            })
            actions.append(action)
        }
        let menu = UIMenu(title: "", children: actions)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil,
                                                           image: UIImage(systemName: "ellipsis"),
                                                           primaryAction: nil, menu: menu)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.accessibilityLabel = "menu"
    }
}
