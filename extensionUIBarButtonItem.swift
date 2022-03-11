//
//  extensionUIBarButtonItem.swift
//  
//
//  Created by 葉書誠 on 2022/3/11.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    static func addButton(_ target: Any?,
                          action: Selector,
                          imageName: String,
                          size:CGSize = CGSize(width: 28, height: 28),
                          tintColor:UIColor?) -> UIBarButtonItem
    {
        let button = UIButton(type: .system)
        button.tintColor = tintColor
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        
        return menuBarItem
    }
}
