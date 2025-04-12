//
//  ServicesViewController.swift
//
//  Copyright © 2018 Minimalistic Apps. All rights reserved.
//

import UIKit
import SPAlert

class ServicesParentViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    public var calculateFareResult: CalculateFareMutation.Data.CalculateFare!
    public var callback: ServiceRequested?
    private var selectedCategory: CalculateFareMutation.Data.CalculateFare.Service?
    private var selectedService: CalculateFareMutation.Data.CalculateFare.Service.Service?
    
    @IBOutlet weak var buttonRideNow: ColoredButton!
    @IBOutlet weak var buttonRideLater: ColoredButton!
    @IBOutlet weak var tabBar: UISegmentedControl!
    @IBOutlet weak var collectionServices: UICollectionView!
    @IBOutlet weak var viewBlur: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.addTarget(self, action: #selector(tabChanged), for: .valueChanged)
        self.collectionServices.dataSource = self
        self.collectionServices.delegate = self
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewBlur.addSubview(blurEffectView)
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        self.view.layer.mask = maskLayer
    }
    
    public func reload() {
        let segments = calculateFareResult.services.map() { x in return x.name }
        self.tabBar.removeAllSegments()
        for (index, value) in segments.enumerated() {
            self.tabBar.insertSegment(withTitle: value, at: index, animated: false)
        }
        self.tabBar.selectedSegmentIndex = 0
        self.tabChanged(sender: self.tabBar)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let cat = self.selectedCategory else {
            return 0
        }
        return cat.services.count
    }
    
    @objc func tabChanged(sender: UISegmentedControl) {
        self.selectedCategory = self.calculateFareResult.services[sender.selectedSegmentIndex]
        
        self.collectionServices.reloadData()
        self.collectionServices.performBatchUpdates({ [weak self] in
            self?.collectionServices.reloadSections(IndexSet(integer: 0))
            }) { completed -> Void in
            for indexPath in self.collectionServices.indexPathsForSelectedItems ?? [] {
                self.collectionServices.deselectItem(at: indexPath, animated: false)
            }
            if self.collectionServices.indexPathsForVisibleItems.count == 1 {
                self.collectionServices.selectItem(at: self.collectionServices.indexPath(for: self.collectionServices.visibleCells.first!), animated: false, scrollPosition: [])
                self.selectedService = self.selectedCategory!.services.first
                self.buttonRideNow.isEnabled = true
                self.buttonRideLater.isEnabled = true
//                if self.selectedService!.bookingMode == .OnlyNow {
//                    self.buttonRideLater.isHidden = true
//                }
                let localizedFormat = NSLocalizedString("Request %@ Now", comment: "Request service button.")
                let formattedString = String(format: localizedFormat, arguments: [self.selectedService?.name ?? ""])
                self.buttonRideNow.setTitle(formattedString, for: .normal)
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serviceCell", for: indexPath) as! ServicesListCell
        cell.initialize(service: (selectedCategory?.services[indexPath.row])!, distance: self.calculateFareResult.distance, duration: self.calculateFareResult.duration, currency: self.calculateFareResult.currency)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let feedbackGenerator = UISelectionFeedbackGenerator()
        feedbackGenerator.selectionChanged()
        selectedService = (selectedCategory?.services[indexPath.row])!
        buttonRideNow.isEnabled = true
        buttonRideLater.isEnabled = true
        let localizedFormat = NSLocalizedString("Request %@ Now", comment: "Request service button.")
        let formattedString = String(format: localizedFormat, arguments: [self.selectedService?.name ?? ""])
        self.buttonRideNow.setTitle(formattedString, for: .normal)
    }
    
    @IBAction func onSelectServiceClicked(_ sender: UIButton) {
        if let d = callback {
            d.RideNowSelected(service: selectedService!)
        }
    }
    
    @IBAction func onBookLaterClicked(_ sender: ColoredButton) {
        DatePickerDialog().show(NSLocalizedString("Select Time", comment: "Select Time dialog title"), doneButtonTitle: NSLocalizedString("Done", comment: "Select time dialog action"), cancelButtonTitle: NSLocalizedString("Cancel", comment: ""), datePickerMode: .dateAndTime) {
            (date) -> Void in
            if let dt = date, let d = self.callback {
                
                let seconds = dt.timeIntervalSince(Date())
                if seconds < 30 {
                    let message = UIAlertController(title: NSLocalizedString("Problem", comment: ""), message: NSLocalizedString("Time selected seems to be for past. Select a future time or now!", comment: ""), preferredStyle: .alert)
                    message.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                    self.parent!.present(message, animated: true, completion: nil)
                    return
                }
                d.RideLaterSelected(service: self.selectedService!, minutesFromNow: Int(seconds / 60))
            }
        }
    }
}

protocol ServiceRequested {
    func RideNowSelected(service: CalculateFareMutation.Data.CalculateFare.Service.Service)
    func RideLaterSelected(service: CalculateFareMutation.Data.CalculateFare.Service.Service, minutesFromNow: Int)
}
