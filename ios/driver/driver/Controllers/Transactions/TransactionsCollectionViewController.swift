//
//  TravelTableViewController.swift
//  Rider
//
//  Copyright © 2018 minimalistic apps. All rights reserved.
//

import UIKit


class TransactionsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    //MARK: Properties
    let cellIdentifier = "TransactionsCollectionViewCell"
    var transactions = [TransactionsQuery.Data.DriverTransacion.Edge]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView?.register(nibCell, forCellWithReuseIdentifier: cellIdentifier)
        self.refreshList(self)
    }
    
    @IBAction func refreshList(_ sender: Any) {
        Network.shared.apollo.fetch(query: TransactionsQuery()) { result in
            switch result {
            case .success(let response):
                guard let _transactions = response.data?.driverTransacions.edges else {
                    return
                }
                self.transactions = _transactions
                self.collectionView?.reloadData()
                    
                
            case .failure(let error):
                error.showAlert()
                
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let kWhateverHeightYouWant = 70
        return CGSize(width: collectionView.bounds.size.width, height: CGFloat(kWhateverHeightYouWant))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transactions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TransactionsCollectionViewCell  else {
            fatalError("The dequeued cell is not an instance of TransactionsCollectionViewCell.")
        }
        // Fetches the appropriate meal for the data source layout.
        let transaction = transactions[indexPath.row]
        cell.transaction = transaction
        //cell.background.colorId = indexPath.row
        return cell
    }
}

