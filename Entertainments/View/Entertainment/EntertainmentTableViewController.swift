//
//  EntertainmentTableViewController.swift
//  Entertainments
//
//  Created by Penka Yochkova on 8.11.22.
//

import UIKit

class EntertainmentTableViewController: UITableViewController {
    
    private struct Constacts {
        static let entertainmentCellIdentifier = "entertainmentCellIdentifier"
    }
    
    private var entertainmentModel: EntertainmentViewModelForShow? {
        didSet {
            self.tvShows = self.entertainmentModel?.entertainment?.showsAt?.at
        }
    }
    private var tvShows: [TVShow]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Entertainments".localized
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort".localized, style: .plain, target: self, action: #selector(self.didTapSortButton(_:)))
        
        // Add refresh control
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(didChangeRefreshControlValue(_:)), for: .valueChanged)
        self.tableView.refreshControl = self.refreshControl
        
        // Fetch data from Json file
        self.fetchDate()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tvShows?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constacts.entertainmentCellIdentifier, for: indexPath) as! TVShowCell
        if let tvShow = self.tvShows?[indexPath.row] {
            cell.setUpData(tvShow: tvShow)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - Private methods
    
    private func removeDuplicatesInList() {
        var arrayWithDuplicates: [TVShow] = []
        self.tvShows?.forEach { element in
            if(!arrayWithDuplicates.contains(where: { show in
                show.id == element.id
            })) {
                arrayWithDuplicates.append(element)
            }
        }
        self.clearAllTVShowsAndAdd(newList: arrayWithDuplicates)
    }
    
    private func fetchDate() {
        /*
         * Load data from JOSN file
         */
        self.refreshControl?.beginRefreshing()
        self.entertainmentModel = EntertainmentViewModelForShow()
        self.entertainmentModel?.loadJsonFile()
        
        /*
         * Remove duplicates from tv shows array
         */
        self.removeDuplicatesInList()
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    private func presentModal() {
        let sortViewController = SortTableViewController()
        sortViewController.delegate = self
        let navigation = UINavigationController(rootViewController: sortViewController)
        navigation.modalPresentationStyle = .pageSheet
        navigation.isModalInPresentation = true
        
        if let sheet = navigation.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(navigation, animated: true, completion: nil)
        
    }
    
    private func sortData(sortType: Utils.SortType) {
        let shows = self.tvShows
        switch sortType {
        case .Earliest:
            
            guard let sortedArray = shows?.bubbleSort(by: (>)) else { return }
            self.clearAllTVShowsAndAdd(newList: sortedArray)
            
            // Reload table view
            self.tableView.reloadData()
        case .Latest:
            
            guard let sortedArray = shows?.bubbleSort(by: (<)) else { return }
            self.clearAllTVShowsAndAdd(newList: sortedArray)
            
            // Reload table view
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Action methods
    
    @objc private func didChangeRefreshControlValue(_ sender: Any) {
        self.fetchDate()
    }
    
    @objc private func didTapSortButton(_ sender: Any) {
        self.presentModal()
    }
    
    private func clearAllTVShowsAndAdd(newList: [TVShow]) {
        self.entertainmentModel?.entertainment?.showsAt?.at?.removeAll()
        self.entertainmentModel?.entertainment?.showsAt?.at?.append(contentsOf: newList)
    }
    
}

extension EntertainmentTableViewController: SortTableViewControllerDelegate {
    
    func didSelectSortType(sortType: Utils.SortType) {
        self.sortData(sortType: sortType)
    }
}
