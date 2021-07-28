//
//  Extensions.swift
//  ExpandableTableView-Example
//
//  Created by ADMIN on 28/07/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

extension UIView {
    func addTapGestureRecognizer(with action: Selector, target: Any, tag: Int = 0) {
        let tapGestureRegcognizer = UITapGestureRecognizer()
        self.tag = tag
        tapGestureRegcognizer.addTarget(target, action: action)
        tapGestureRegcognizer.numberOfTapsRequired = 1
        tapGestureRegcognizer.numberOfTouchesRequired = 1
        addGestureRecognizer(tapGestureRegcognizer)
    }
}
