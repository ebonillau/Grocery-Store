//
//  AddBagControl.swift
//  Sample 2
//
//  Created by Enrique Bonilla on 26/02/21.
//

import UIKit

class GroceryItemCell: UITableViewCell {
        
    @IBOutlet weak var imageIV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stackViewContainer: UIStackView!
    
    lazy var bagControl: AddBagControl = {
        let control = AddBagControl.loadFromNib()
        let bagViewModel = BagViewModel(title: "ADD TO BAG", stepValue: 0)
        control.configure(withViewModel: bagViewModel, bagClousure: { (stepValue) in
            print("Step Value \(stepValue)")
        })
        return control
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(usingViewModel viewModel: GroceryItemViewModel) {
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.details
        self.imageIV.image = UIImage(named: viewModel.image)
        self.priceLabel.text = viewModel.price
        stackViewContainer.addArrangedSubview(bagControl)
    }

}
