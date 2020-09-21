//
//  UIImageView+Remote.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func load(with: String) {
        let placeholder = UIImage(systemName: "photo.fill")

        if let url = URL(string: with) {
            self.kf.setImage(with: url, placeholder: placeholder)
        } else {
            self.image = placeholder
        }
    }
}
