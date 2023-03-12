//
//  UIImageView+Style.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import UIKit

extension UIImageView {
   func makeRoundCorners(byRadius rad: CGFloat) {
      self.layer.cornerRadius = rad
      self.clipsToBounds = true
   }
}
