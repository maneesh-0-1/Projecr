//
//  TravelViewController.swift
//  Rider
//
//  Copyright © 2018 minimalistic apps. All rights reserved.
//

import UIKit
import MapKit
import SPAlert
import Kingfisher
import Apollo
import MessageKit

class TravelViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var labelCost: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var buttonCall: ColoredButton!
    @IBOutlet weak var buttonMessage: ColoredButton!
    @IBOutlet weak var buttonCancel: ColoredButton!
    @IBOutlet weak var buttonPay: ColoredButton!
    
    var pickupMarker = MKPointAnnotation()
    var destinationMarkers: [MKPointAnnotation] = []
    var driverMarker = MKPointAnnotation()
    var timer: Timer!
    @IBOutlet weak var confirmationBarButton: UIBarButtonItem!
    @IBOutlet weak var tabBar: UISegmentedControl!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var viewStatistics: UIView!
    @IBOutlet weak var viewDriver: UIStackView!
    @IBOutlet weak var textDriverName: UILabel!
    @IBOutlet weak var textPlateNumber: UILabel!
    @IBOutlet weak var imgDriver: UIImageView!
    
    private var currentOrder: CurrentOrder!
    private var subscriptionOrderUpdate: Cancellable?
    private var subscriptionDriverLocationUpdate: Cancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscriptionOrderUpdate = Network.shared.apollo.subscribe(subscription: UpdatedOrderSubscription()) { [weak self] result in
            guard let self = self else {
              return
            }
            
            switch result {
                      case .success(let graphQLResult):
                if let order = graphQLResult.data?.orderUpdated.fragments.currentOrder {
                    self.refreshScreen(order: order, driverLocation: nil)
                }
                
            case .failure(_):
                self.dismiss(animated: true, completion: nil)
            }
        }
        tabBar.addTarget(self, action: #selector(selectedTabItem), for: .valueChanged)
        map.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 330, right: 0)
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.addSubview(blurEffectView)
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        self.backgroundView.layer.mask = maskLayer
        driverMarker = MKPointAnnotation()
        map.delegate = self
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = nil
    }
    
    deinit {
        self.subscriptionOrderUpdate?.cancel()
    }
    
    @objc func selectedTabItem(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            viewDriver.isHidden = true
            viewStatistics.isHidden = false
        } else {
            viewDriver.isHidden = false
            viewStatistics.isHidden = true
        }
    }
    
    @IBAction func onMessageTapped(_ sender: UIButton) {
        let vc = ChatViewController()
        vc.sender = currentOrder.driver!
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.requestRefresh()
    }
    
    @objc func onEachSecond() {
        let now = Date()
        let etaInterval = currentOrder.startTimestamp != nil ? (currentOrder.startTimestamp! / 1000) + Double(currentOrder.durationBest) : currentOrder.etaPickup! / 1000
        let etaTime = Date(timeIntervalSince1970: etaInterval)
        if etaTime <= now {
            if currentOrder.status == .arrived {
                labelTime.text = NSLocalizedString("Arrived!", comment: "Driver Arrived text instead of time.")
            } else {
                labelTime.text = NSLocalizedString("Soon!", comment: "When driver is coming later than expected.")
            }
            
        } else {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.minute, .second]
            formatter.unitsStyle = .short
            labelTime.text = formatter.string(from: now, to: etaTime)
        }
    }
    
    @objc private func requestRefresh() {
        Network.shared.apollo.fetch(query: GetCurrentOrderQuery()) { result in
            switch result {
            case .success(let response):
                if let order = response.data?.currentOrderWithLocation {
                    self.currentOrder = order.order.fragments.currentOrder
                    self.refreshScreen(order: self.currentOrder, driverLocation: order.driverLocation?.fragments.point.toCoord())
                }
                
            case .failure(_):
                self.navigationController?.popViewController(animated: false)
            }
        }
    }
    
    private func refreshScreen(order: CurrentOrder, driverLocation: CLLocationCoordinate2D?) {
        subscriptionDriverLocationUpdate?.cancel()
        subscriptionDriverLocationUpdate = Network.shared.apollo.subscribe(subscription: DriverLocationUpdatedSubscription(driverId: order.driver!.id)) { location in
            switch location {
            case .success(let data):
                if let _location = data.data?.driverLocationUpdated.fragments.point.toCoord() {
                    self.driverMarker.coordinate = _location
                    self.map.addAnnotation(self.driverMarker)
                    self.map.showAnnotations([self.pickupMarker, self.driverMarker], animated: true)
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
        textDriverName.text = "\(order.driver?.firstName ?? "- ") \(order.driver?.lastName ?? "")"
        var details = [String]()
        if let carName = order.driver?.car?.name {
            details.append(carName)
        }
        if let carColor = order.driver?.carColor?.name {
            details.append(carColor)
        }
        if let carPlate = order.driver?.carPlate {
            details.append(carPlate)
        }
        textPlateNumber.text = details.joined(separator: ", ")
        self.labelCost.text = MyLocale.formattedCurrency(amount: order.costAfterCoupon, currency: order.currency)
        if let driverImage = order.driver?.media?.address {
            let processor = DownsamplingImageProcessor(size: imgDriver.intrinsicContentSize) |> RoundCornerImageProcessor(cornerRadius: imgDriver.intrinsicContentSize.width / 2)
            let url = URL(string: Config.Backend + driverImage.replacingOccurrences(of: " ", with: "%20"))
            imgDriver.kf.setImage(with: url, placeholder: UIImage(named: "Nobody"), options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ], completionHandler: { result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            })
        }
        switch order.status {
        case .riderCanceled, .driverCanceled:
            let alert = UIAlertController(title: NSLocalizedString("Message", comment: ""), message: NSLocalizedString("Service Has Been Canceled.", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Alright!", comment: ""), style: .default) { action in
                _ = self.navigationController?.popViewController(animated: true)
            })
            present(alert, animated: true)
            break
            
        case .driverAccepted:
            pickupMarker.coordinate = order.points[0].fragments.point.toCoord()
            map.addAnnotation(pickupMarker)
            if let _location = driverLocation {
                driverMarker.coordinate = _location
                map.addAnnotation(driverMarker)
                map.showAnnotations([pickupMarker, driverMarker], animated: true)
            } else {
                let region = MKCoordinateRegion(center: order.points[0].fragments.point.toCoord(), latitudinalMeters: 1000, longitudinalMeters: 1000)
                map.setRegion(region, animated: true)
            }
            break
            
        case .arrived:
            SPAlert.present(title: "Driver has arrived", preset: .flag)
            break
            
        case .started:
            buttonCall.isHidden = true
            buttonMessage.isHidden = true
            buttonCancel.isHidden = true
            map.removeAnnotation(pickupMarker)
            for (index, point) in order.points.enumerated() {
                if index == 0 {
                    continue;
                }
                let p = MKPointAnnotation()
                p.coordinate = point.fragments.point.toCoord()
                destinationMarkers.append(p)
                map.addAnnotation(p)
            }
            if driverLocation != nil || destinationMarkers.count > 1 {
                if(driverLocation != nil) {
                    driverMarker.coordinate = driverLocation!
                    map.addAnnotation(driverMarker)
                    destinationMarkers.append(driverMarker)
                    map.showAnnotations(destinationMarkers, animated: true)
                    destinationMarkers.removeLast()
                } else {
                    map.showAnnotations(destinationMarkers, animated: true)
                }
            } else {
                let region = MKCoordinateRegion(center: order.points[1].fragments.point.toCoord(), latitudinalMeters: 1000, longitudinalMeters: 1000)
                map.setRegion(region, animated: true)
            }
            break
            
        case .waitingForPostPay:
            if order.service.paymentMethod == .onlyCash {
                let alert = UIAlertController(title: NSLocalizedString("Payment", comment: ""), message: NSLocalizedString("Service Has Been finished and payment is waiting to be settled.", comment: ""), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Alright!", comment: ""), style: .default) { action in
                    self.requestRefresh()
                })
            } else {
                if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Wallet") as? WalletViewController {
                    vc.amount = order.costAfterCoupon
                    vc.currency = order.currency
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            
            break
            
        case .waitingForReview:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "finishedViewController")
            self.navigationController?.pushViewController(controller, animated: false)
            break
            
        case .finished:
            SPAlert.present(title: NSLocalizedString("Done!", comment: ""), preset: .done)
            self.navigationController?.popViewController(animated: true)
            
        default:
            let alert = UIAlertController(title: "Error", message: "Unknown status: \(order.status.rawValue)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Allright!", style: .default) { action in
                _ = self.navigationController?.popViewController(animated: true)
            })
            self.present(alert, animated: true)
        }
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onEachSecond), userInfo: nil, repeats: true)
    }
    
    @IBAction func onCancelTapped(_ sender: UIButton) {
        LoadingOverlay.shared.showOverlay(view: self.navigationController?.view)
        Network.shared.apollo.perform(mutation: CancelOrderMutation()) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(let data):
                if let order = data.data?.cancelOrder.fragments.currentOrder {
                    self.refreshScreen(order: order, driverLocation: nil)
                }
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
    
    @IBAction func onWalletTapped(_ sender: UIButton) {
        buttonPay.isHidden = true
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Wallet") as? WalletViewController {
            vc.amount = currentOrder.costAfterCoupon
            vc.currency = currentOrder.currency
            self.navigationController!.pushViewController(vc, animated: true)
        }
    }
        
    @IBAction func onSelectCouponClicked(_ sender: UIButton) {
        let title = NSLocalizedString("Add Coupon", comment: "Add Coupon message title")
        let message = NSLocalizedString("Enter your coupon code",comment: "")
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        dialog.addTextField() { textField in
            textField.placeholder = NSLocalizedString("Coupon Code",comment: "")
        }
        dialog.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Message OK button"), style: .default) { action in
            
            Network.shared.apollo.perform(mutation: ApplyCouponMutation(code: dialog.textFields![0].text!)) { result in
                switch result {
                case .success(_):
                    self.requestRefresh()
                    
                case .failure(let error):
                    error.showAlert()
                }
            }
        })
        dialog.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Message Cancel Button"), style: .cancel))
        self.present(dialog, animated: true)
    }
    
    enum MarkerType: String {
        case pickup = "pickup"
        case dropoff = "dropOff"
        case driver = "driver"
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MKPointAnnotation else { return nil }
        let identifier = annotation == pickupMarker ? MarkerType.pickup : (annotation == driverMarker ? MarkerType.driver : MarkerType.dropoff)
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier.rawValue) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier.rawValue)
            switch(identifier) {
            case .pickup:
                view.glyphImage = UIImage(named: "annotation_glyph_home")
                view.markerTintColor = UIColor(hex: 0x009688)
                break;
                
            case .dropoff:
                view.markerTintColor = UIColor(hex: 0xFFA000)
                break;
                
            default:
                view.glyphImage = UIImage(named: "annotation_glyph_car")
            }
        }
        return view
    }
    
    @IBAction func onCallTouched(_ sender: UIButton) {
        if let call = currentOrder.driver?.mobileNumber, let url = URL(string: "tel://+\(call)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

extension CurrentOrder.Driver: SenderType {
    public var senderId: String {
        get {
            return id
        }
    }
    
    public var displayName: String {
        get {
            return firstName + " " + lastName
        }
    }
        
}


public extension CurrentOrder.Point {
    func toCoord() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
}
