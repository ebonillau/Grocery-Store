//
//  ViewController.swift
//  Sample 2
//
//  Created by Enrique Bonilla on 26/02/21.
//

import UIKit

protocol HomeView: class {
    func updateGroceries(groceriesList: [GroceryItemViewModel]) -> ()
}

class HomeViewController: UIViewController {
        
    var presenter: HomePresentation?

    @IBOutlet weak var groceriesTV: UITableView!
    
    private static let groceryCellId = "groceryCellId"
    
    var dataSource: [GroceryItemViewModel] = [] {
        didSet {
            groceriesTV.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
//        stackV.addArrangedSubview(addBagControl)
        groceriesTV.register(UINib(nibName: "GroceryItemCell", bundle: nil), forCellReuseIdentifier: HomeViewController.groceryCellId)
        groceriesTV.dataSource = self
        groceriesTV.delegate = self
    }

}

extension HomeViewController: HomeView {
    
    func updateGroceries(groceriesList: [GroceryItemViewModel]) {
        print("Grocery List: \(groceriesList)")
        dataSource = groceriesList
    }
    
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.groceryCellId) as! GroceryItemCell
        cell.configure(usingViewModel: viewModel)
        return cell
    }
    
    
}

