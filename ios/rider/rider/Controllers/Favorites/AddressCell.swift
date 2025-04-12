//
//  AddressCell.swift
//  rider
//
//  Copyright © 2018 Minimalistic Apps. All rights reserved.
//

import UIKit


class AddressCell: UICollectionViewCell {
    @IBOutlet weak var textTitle: UILabel!
    var address:GetAddressesQuery.Data.RiderAddress?
    weak var delegate:FavoriteAddressDialogDelegate?
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var textAddress: UILabel!
    
    @IBAction func onEditClicked(_ sender: Any) {
        delegate?.update(address: address!)
    }
    
    @IBAction func onDeleteClicked(_ sender: Any) {
        delegate?.delete(id: address!.id)
    }
    
}
protocol FavoriteAddressDialogDelegate: AnyObject {
    func delete(id:String)
    func update(address:GetAddressesQuery.Data.RiderAddress)
}
