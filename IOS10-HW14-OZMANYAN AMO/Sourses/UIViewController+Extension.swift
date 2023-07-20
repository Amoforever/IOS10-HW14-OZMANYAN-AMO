//
//  UIViewController+Extension.swift
//  IOS10-HW14-OZMANYAN AMO
//
//  Created by Amahastla on 20.07.2023.
//

import UIKit

extension UIView {
    
    func addSubviewsForAutoLayout(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}

