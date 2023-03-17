//
//  Extensions+.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
