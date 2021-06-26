//
//  UiViewExtension.swift
//  Bintan-App
//
//  Created by angga saputra on 21/06/21.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat{
        get { return self.cornerRadius}
        set { self.layer.cornerRadius = newValue}
    }
}



