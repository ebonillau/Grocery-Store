//
//  AddBagControl.swift
//  Sample 2
//
//  Created by Enrique Bonilla on 26/02/21.
//

import UIKit

class AddBagControl: UIControl, ViewLoadable {
    
    @IBOutlet weak var addToBagButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minussButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    static var nibName: String = "AddBagControl"
    
    var bagClousure: BagClousure?

    // MARK: Hide Add and Minus Buttons Logic
    
    var bagViewModel: BagViewModel! {
        didSet {
            let isHidden = bagViewModel.showStepper
            addToBagButton.isHidden = isHidden
            bottomStackView.isHidden = !isHidden
            stepLabel.text = "\(bagViewModel.stepValue)"
        }
    }
    
    
    @IBAction func addToBagButton(_ sender: UIButton) {
        bagViewModel = bagViewModel.onAddToBag()
        bagClousure?(bagViewModel.stepValue)
    }
    
    @IBAction func incrementButton(_ sender: UIButton) {
        bagViewModel = bagViewModel.onIncrement()
        bagClousure?(bagViewModel.stepValue)
    }
    
    @IBAction func decrementButton(_ sender: UIButton) {
        bagViewModel = bagViewModel.onDecrement()
        bagClousure?(bagViewModel.stepValue)
    }
    
    typealias BagClousure = (Int) -> ()
    
    func configure(withViewModel addBagViewModel: BagViewModel, bagClousure: @escaping BagClousure) {
        self.bagViewModel = addBagViewModel
        self.addToBagButton.setTitle(bagViewModel.title, for: .normal)
        self.bagClousure = bagClousure
    }
    
}

struct BagViewModel {
    let title: String
    let stepValue: Int
    let showStepper: Bool
    
    init(title: String, stepValue: Int) {
        self.title = title
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
    }
}

extension BagViewModel {
    func onAddToBag() -> BagViewModel {
        return BagViewModel(title: title, stepValue: 1)
    }
    
    func onIncrement() -> BagViewModel {
        guard stepValue < 5 else { return self }
        return BagViewModel(title: title, stepValue: stepValue + 1)
    }
    
    func onDecrement() -> BagViewModel {
        guard stepValue > 0 else { return self }
        return BagViewModel(title: title, stepValue: stepValue - 1)
    }
}
