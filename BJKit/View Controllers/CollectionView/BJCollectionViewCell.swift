//
//  BJCollectionViewCell.swift
//  BJKit
//
//  Created by Joseph Peter, Gabriel Benny Francis on 4/27/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

class BJCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!

    func configureCell(item: String) {
        textLabel.text = item
    }
    
}
