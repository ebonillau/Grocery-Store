//
//  AddBagControl.swift
//  Sample 2
//
//  Created by Enrique Bonilla on 26/02/21.
//

import UIKit

class GroceryItemCell: UITableViewCell {
    
//    static var nibName: String = "GroceryItemCell"
    
    @IBOutlet weak var imageIV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(usingViewModel viewModel: GroceryItemViewModel) {
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.details
        self.imageIV.image = UIImage(named: viewModel.image)
        self.priceLabel.text = viewModel.price
    }

}
