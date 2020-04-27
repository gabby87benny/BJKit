//
//  BJCollectionViewController.swift
//  BJKit
//
//  Created by Joseph Peter, Gabriel Benny Francis on 4/27/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

struct BJCollectionViewControllerConstants {
    static let collectionCellIdentifier = "BJCollectionViewCellIdentifier"
}

class BJCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension BJCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BJCollectionViewControllerConstants.collectionCellIdentifier, for: indexPath) as? BJCollectionViewCell else {
            print("Problem with collection view cell")
            return UICollectionViewCell()
        }
        cell.backgroundColor = UIColor.cyan
        cell.configureCell(item: self.items[indexPath.row])
        return cell
    }
}

extension BJCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item: \(self.items[indexPath.row])")
    }
}
