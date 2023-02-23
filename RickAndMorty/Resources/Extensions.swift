//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 23/02/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
