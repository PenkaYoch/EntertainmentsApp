//
//  SortTableViewController.swift
//  Entertainments
//
//  Created by Penka Yochkova on 27.12.22.
//

import UIKit

protocol SortTableViewControllerDelegate {
    func didSelectSortType(sortType: Utils.SortType)
}

class SortTableViewController: UITableViewController {
    
    fileprivate struct Constants {
        static let sortTableViewIdentifier = "sortCellIdentifier"
    }

    private var sortTypes = ["Earliest start time".localized, "Latest start time".localized]
    var delegate: SortTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sort".localized
        self.tableView.register(UINib(nibName: String(describing: SortTableViewCell.self), bundle: nil), forCellReuseIdentifier: Constants.sortTableViewIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.sortTableViewIdentifier, for: indexPath) as! SortTableViewCell
        cell.titleLabel.text = sortTypes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case Utils.SortType.Earliest.rawValue:
            
            self.delegate?.didSelectSortType(sortType: Utils.SortType.Earliest)
            self.dismiss(animated: true)
            
        case Utils.SortType.Latest.rawValue:
            
            self.delegate?.didSelectSortType(sortType: Utils.SortType.Latest)
            self.dismiss(animated: true)
        default:
            break
        }
    }

}
