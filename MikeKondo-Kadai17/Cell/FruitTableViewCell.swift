//
//  FruitTableViewCell.swift
//  MikeKondo-Kadai17
//
//  Created by 近藤米功 on 2022/09/16.
//

import UIKit

class FruitTableViewCell: UITableViewCell {
    // MARK: - UI Parts
    @IBOutlet private weak var checkMarkImageView: UIImageView!
    @IBOutlet private weak var fruitNameLabel: UILabel!

    static let identifier = "fruitCell"
    static let nibName = "FruitTableViewCell"

    func configure(fruit: Fruit) {
        fruitNameLabel.text = fruit.name
        checkMarkImageView.isHidden = !fruit.isCheck
    }
}
