//
//  TripHistoryCollectionViewCell.swift
//  rider
//
//  Copyright © 2018 minimal. All rights reserved.
//

import UIKit


class TransactionsCollectionViewCell: UICollectionViewCell {
    public var transaction: TransactionsQuery.Data.RiderTransacion.Edge?
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textdescription: UILabel!
    @IBOutlet weak var background: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let tr = transaction {
            title.text = getTransactionTypeString(node: tr.node)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
            textdescription.text = "\(MyLocale.formattedCurrency(amount: tr.node.amount, currency: tr.node.currency)) at \(dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(tr.node.createdAt / 1000))))"
        }
    }
    
    private func getTransactionTypeString(node: TransactionsQuery.Data.RiderTransacion.Edge.Node) -> String {
        switch node.action {
        case .deduct:
            switch node.deductType! {
            case .orderFee:
                return "Order Fee"
            case .withdraw:
                return "Withdraw"
            case .correction:
                return "Correction"
            case .__unknown(_):
                return "Unknown"
            }
            
        case .recharge:
            switch node.rechargeType! {
                
            case .bankTransfer:
                return "Bank Transfer"
            case .gift:
                return "Gift"
            case .correction:
                return "Correction"
            case .inAppPayment:
                return "In-App Payment"
            case .__unknown(_):
                return "Unknown"
            }
        case .__unknown(_):
            return "Unknown"
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
