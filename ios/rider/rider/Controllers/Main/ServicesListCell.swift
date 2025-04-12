//
//  ServicesListCell.swift
//
//  Copyright © 2018 Minimalistic Apps. All rights reserved.
//

import UIKit
import Kingfisher

class ServicesListCell: UICollectionViewCell {
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textCost: UILabel!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    private var service: CalculateFareMutation.Data.CalculateFare.Service.Service!
    private var quantity: Int = 0
    private var distance: Double = 0
    private var duration: Double = 0
    private var currency: String = ""
    
    override var isSelected: Bool {
        didSet {
            self.contentView.alpha = isSelected ? 1 : 0.5
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.alpha = 0.5
    }
    
    func initialize(service:CalculateFareMutation.Data.CalculateFare.Service.Service, distance: Double, duration: Double, currency: String) {
        self.service = service
        self.distance = Double(distance)
        self.duration = Double(duration)
        self.currency = currency
        self.updatePrice()
        textTitle.text = service.name
        let url = URL(string: Config.Backend + service.media.address)
        imageIcon.kf.setImage(with: url)
        buttonPlus.isHidden = true
        buttonMinus.isHidden = true
    }
    
    func updatePrice() {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        textCost.text = formatter.string(from: NSNumber(value: service.cost))
    }
    
    @IBAction func onButtonMinusTouched(_ sender: UIButton) {
        if quantity > 0 {
            quantity -= 1
        }
        updatePrice()
    }
    
    @IBAction func onButtonPlusTouched(_ sender: UIButton) {

    }
}
