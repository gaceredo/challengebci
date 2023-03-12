//
//  ReusableView.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation
import UIKit

public protocol BundleProtocol {
    var viewBundle: Bundle { get set }
}

/* Class intented for inheritance */

open class ReusableView: UIView, BundleProtocol {
    open var viewBundle: Bundle = Bundle.main

    public var contentView: UIView!

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibInit()
        setup()
    }

    public func xibInit() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(contentView)
    }

    public func setup() {

    }

    public func loadViewFromNib() -> UIView! {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: viewBundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            return UIView()
        }

        return view
    }
}
